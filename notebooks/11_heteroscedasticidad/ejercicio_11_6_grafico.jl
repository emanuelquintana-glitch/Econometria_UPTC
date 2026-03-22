using LinearAlgebra
using StatsPlots
using Pkg
Pkg.add(["Plots", "StatsBase", "LaTeXStrings"])

using Plots, StatsBase, LaTeXStrings, Random
gr()

Random.seed!(42)

# ── Datos simulados coherentes con los resultados de Hanushek-Jackson ──────
n    = 30
pnb  = range(300, 1500, length=n) |> collect
def  = 0.08 .* pnb .+ randn(n) .* 15

β1, β2, β3 = 26.19, 0.6248, -0.4398

σ   = 0.03
u   = σ .* pnb .* randn(n)
C   = β1 .+ β2 .* pnb .+ β3 .* def .+ u

# ── Residuos MCO ─────────────────────────────────────────────────────────
X   = hcat(ones(n), pnb, def)
β̂   = X \ C
û   = C .- X * β̂

# ── Pesos MCP: w_t = 1/PNB_t^2 ──────────────────────────────────────────
w   = 1.0 ./ pnb.^2
W   = Diagonal(w)
β̂w  = (X' * W * X) \ (X' * W * C)
ûw  = C .- X * β̂w

# ── PALETA ───────────────────────────────────────────────────────────────
negro  = RGB(0.10, 0.10, 0.10)
rojo   = RGB(0.72, 0.15, 0.15)
azul   = RGB(0.13, 0.37, 0.60)
verde  = RGB(0.13, 0.55, 0.30)
crema  = RGB(0.97, 0.96, 0.93)

# ── FIGURA ───────────────────────────────────────────────────────────────
fig = plot(
    layout         = (2, 2),
    size           = (1100, 820),
    bg             = crema,
    bg_outside     = crema,
    titlefontsize  = 11,
    guidefontsize  = 10,
    tickfontsize   = 9,
    legendfontsize = 9,
    margin         = 6Plots.mm,
    dpi            = 180,
)

# ── Panel A: Residuos MCO vs PNB ─────────────────────────────────────────
scatter!(pnb, û,
    subplot = 1,
    xlabel  = "PNB_t",
    ylabel  = L"\hat{u}_t \;\text{(MCO)}",
    title   = "Panel A · Residuos MCO vs PNB\n(patrón de abanico → heteroscedasticidad)",
    color   = azul, alpha = 0.75, ms = 5, msw = 0, label = false, bg = :white,
)
hline!([0], subplot=1, color=negro, lw=1.2, ls=:dash, label=false)
pnb_s = range(minimum(pnb), maximum(pnb), length=200) |> collect
plot!(pnb_s,  σ .* pnb_s, subplot=1, color=rojo, lw=1.5, ls=:dot, alpha=0.7, label=L"+\sigma \cdot PNB_t")
plot!(pnb_s, -σ .* pnb_s, subplot=1, color=rojo, lw=1.5, ls=:dot, alpha=0.7, label=L"-\sigma \cdot PNB_t")

# ── Panel B: Residuos MCP vs PNB ─────────────────────────────────────────
scatter!(pnb, ûw,
    subplot = 2,
    xlabel  = "PNB_t",
    ylabel  = L"\hat{u}_t^* \;\text{(MCP)}",
    title   = "Panel B · Residuos MCP vs PNB\n(varianza estabilizada)",
    color   = verde, alpha = 0.75, ms = 5, msw = 0, label = false, bg = :white,
)
hline!([0], subplot=2, color=negro, lw=1.2, ls=:dash, label=false)

# ── Panel C: Dispersión residual por cuartil ──────────────────────────────
q       = 4
q_idx   = [findall(x -> x <= quantile(pnb, k/q), pnb) for k in 1:q]
q_label = ["Q$(k)" for k in 1:q]
var_mco = [std(û[i])  for i in q_idx]
var_mcp = [std(ûw[i]) for i in q_idx]
var_mcp_scaled = var_mcp .* (mean(var_mco) / mean(var_mcp))

bar!(1:q, var_mco,
    subplot   = 3,
    xlabel    = "Cuartil de PNB",
    ylabel    = "Desv. estándar residuos",
    title     = "Panel C · Dispersión residual por cuartil",
    xticks    = (1:q, q_label),
    color     = azul, alpha = 0.75, label = "MCO", bg = :white, bar_width = 0.35,
)
bar!((1:q) .+ 0.37, var_mcp_scaled,
    subplot   = 3,
    color     = verde, alpha = 0.75, label = "MCP (reescalado)", bar_width = 0.35,
)

# ── Panel D: Errores estándar MCO vs MCP ─────────────────────────────────
etiquetas  = [L"\beta_1", L"\beta_2", L"\beta_3"]
ee_mco     = [2.73, 0.0060, 0.0736]
ee_mcp     = [2.22, 0.0068, 0.0597]
ee_rel_mco = ones(3)
ee_rel_mcp = ee_mcp ./ ee_mco

groupedbar!(hcat(ee_rel_mco, ee_rel_mcp),
    subplot    = 4,
    xlabel     = "Parámetro",
    ylabel     = "Error estándar relativo (MCO = 1)",
    title      = "Panel D · Errores estándar relativos\n(datos reales del ejercicio)",
    xticks     = (1:3, etiquetas),
    color      = [azul verde],
    alpha      = 0.80,
    label      = ["MCO" "MCP"],
    bg         = :white,
    bar_width  = 0.6,
    lw         = 0,
)
hline!([1.0], subplot=4, color=negro, lw=1.2, ls=:dash, label=false)

for (k, (e1, e2)) in enumerate(zip(ee_mco, ee_mcp))
    annotate!(k - 0.17, ee_rel_mco[k] + 0.03, text("$(e1)", 7, azul),    subplot=4)
    annotate!(k + 0.17, ee_rel_mcp[k] + 0.03, text("$(e2)", 7, verde),   subplot=4)
end

# ── Título global ─────────────────────────────────────────────────────────
plot!(fig,
    plot_title          = "Ejercicio 11.6 · Hanushek & Jackson (1977)\nHeteroscedasticidad en el modelo de consumo: MCO vs MCP",
    plot_titlefontsize  = 12,
    plot_titlefontcolor = negro,
)

savefig(fig, "/mnt/user-data/outputs/ejercicio_11_6_grafico.png")
println("✓ Gráfico guardado en ejercicio_11_6_grafico.png")
