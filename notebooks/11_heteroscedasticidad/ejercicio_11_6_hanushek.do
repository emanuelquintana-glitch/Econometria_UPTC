/* ============================================================
   Ejercicio 11.6 — Gujarati & Porter, 5.a ed.
   Modelo de consumo de Hanushek y Jackson (1977)
   Heteroscedasticidad proporcional al PNB
   Estimación MCO vs MCP · Pruebas · R² retransformado
   ============================================================ */

clear all
set more off
version 17

/* ── 0. Datos (Hanushek & Jackson, 1946–1975) ─────────────────
   Fuente: Gujarati & Porter, Apéndice, Tabla 11.3
   C   = consumo privado (miles de millones USD)
   PNB = producto nacional bruto (miles de millones USD)
   D   = gasto de defensa (miles de millones USD)            */

input year C PNB D
1946  203.5   222.3   45.0
1947  206.3   244.1   14.4
1948  210.8   269.1   11.8
1949  217.6   267.3   13.3
1950  230.5   293.8   14.1
1951  232.8   339.3   33.6
1952  239.4   358.3   46.1
1953  250.8   379.4   49.9
1954  255.7   380.4   41.6
1955  274.2   414.8   40.3
1956  281.4   437.4   40.7
1957  288.2   461.1   44.3
1958  290.1   457.7   44.7
1959  311.2   495.8   45.5
1960  316.5   515.3   44.9
1961  322.5   533.8   47.5
1962  338.4   574.6   51.1
1963  353.3   606.9   52.3
1964  373.7   649.8   53.6
1965  397.7   705.1   49.6
1966  418.1   772.0   56.8
1967  430.1   816.4   70.1
1968  452.7   892.7   76.5
1969  469.1   963.9   78.8
1970  476.9   992.7   73.1
1971  500.5  1077.6   70.8
1972  533.5  1185.9   73.0
1973  567.2  1326.4   74.5
1974  556.9  1434.2   77.8
1975  568.2  1549.2   85.6
end

label var C   "Consumo privado (miles de mill. USD)"
label var PNB "Producto Nacional Bruto (miles de mill. USD)"
label var D   "Gasto de defensa (miles de mill. USD)"

/* ── 1. Estadísticos descriptivos ────────────────────────────── */
di _n "════════════════════════════════════════════"
di    "  Estadísticos descriptivos"
di    "════════════════════════════════════════════"
summarize C PNB D, detail

/* ── 2. MODELO (1): MCO sobre niveles ────────────────────────── */
di _n "════════════════════════════════════════════"
di    "  Modelo (1): MCO — C = β1 + β2·PNB + β3·D"
di    "════════════════════════════════════════════"
regress C PNB D
estimates store MCO

scalar b1_mco = _b[_cons]
scalar b2_mco = _b[PNB]
scalar b3_mco = _b[D]
scalar ee1_mco = _se[_cons]
scalar ee2_mco = _se[PNB]
scalar ee3_mco = _se[D]
scalar r2_mco  = e(r2)

/* ── 3. Pruebas de heteroscedasticidad sobre MCO ─────────────── */
di _n "════════════════════════════════════════════"
di    "  Prueba de Breusch-Pagan (heterosc. general)"
di    "════════════════════════════════════════════"
estat hettest          /* H0: homoscedasticidad */

di _n "════════════════════════════════════════════"
di    "  Prueba de White"
di    "════════════════════════════════════════════"
estat imtest, white

/* Prueba específica: ¿σ² proporcional a PNB²? */
di _n "════════════════════════════════════════════"
di    "  Prueba: log(û²) ~ log(PNB)  [forma Park]"
di    "════════════════════════════════════════════"
predict uhat_mco, residuals
gen u2    = uhat_mco^2
gen log_u2  = log(u2)
gen log_PNB = log(PNB)
regress log_u2 log_PNB
/* Si el coef. de log_PNB ≈ 2, se confirma σ² ∝ PNB² */
di "  → Coeficiente de log(PNB) cercano a 2 confirma el supuesto σ²=σ²PNB²"

/* ── 4. MODELO (2): MCP con pesos w_t = 1/PNB² ───────────────── */
di _n "════════════════════════════════════════════"
di    "  Modelo (2): MCP — pesos w_t = 1/PNB²"
di    "  (equiv. MCO sobre C/PNB = β1·(1/PNB) + β2 + β3·(D/PNB))"
di    "════════════════════════════════════════════"

* Método A: MCP directo con aweights
gen w = 1 / PNB^2
regress C PNB D [aweight = w]
estimates store MCP_directo

* Método B: transformación manual (variable dependiente C/PNB)
gen C_pnb   = C   / PNB
gen inv_PNB = 1   / PNB
gen D_pnb   = D   / PNB

di _n "  — Método B: MCO sobre modelo transformado —"
regress C_pnb inv_PNB D_pnb
estimates store MCP_transform

scalar b1_mcp = _b[inv_PNB]
scalar b2_mcp = _b[_cons]
scalar b3_mcp = _b[D_pnb]
scalar ee1_mcp = _se[inv_PNB]
scalar ee2_mcp = _se[_cons]
scalar ee3_mcp = _se[D_pnb]
scalar r2_mcp  = e(r2)

/* ── 5. Comparación de errores estándar ──────────────────────── */
di _n "════════════════════════════════════════════"
di    "  Comparación de errores estándar"
di    "════════════════════════════════════════════"
di    "  Parámetro  |  MCO (ee)  |  MCP (ee)  |  Cambio"
di    "  ──────────────────────────────────────────────"
di    "  β1         |  " %6.4f ee1_mco "    |  " %6.4f ee1_mcp "    |  " %+5.1f ((ee1_mcp/ee1_mco - 1)*100) "%"
di    "  β2         |  " %6.4f ee2_mco "    |  " %6.4f ee2_mcp "    |  " %+5.1f ((ee2_mcp/ee2_mco - 1)*100) "%"
di    "  β3         |  " %6.4f ee3_mco "    |  " %6.4f ee3_mcp "    |  " %+5.1f ((ee3_mcp/ee3_mco - 1)*100) "%"
di    "  ──────────────────────────────────────────────"
di    "  R²         |  " %6.3f r2_mco  "    |  " %6.3f r2_mcp  "    |  NO COMPARABLES"

/* ── 6. R² retransformado a niveles ──────────────────────────── */
di _n "════════════════════════════════════════════"
di    "  R² retransformado: ajuste de MCP sobre C_t"
di    "════════════════════════════════════════════"

* Predicciones del modelo transformado en niveles de C
estimates restore MCP_transform
predict Cpnb_hat, xb
gen C_hat_mcp = Cpnb_hat * PNB

* R² retransformado manual
quietly summarize C
scalar C_mean = r(mean)
gen num_retrans = (C - C_hat_mcp)^2
gen den_retrans = (C - C_mean)^2
quietly summarize num_retrans
scalar SCR_retrans = r(sum)
quietly summarize den_retrans
scalar SCT = r(sum)
scalar r2_retrans = 1 - SCR_retrans / SCT

di "  R²_MCO             = " %6.4f r2_mco
di "  R²_MCP (sobre C/PNB) = " %6.4f r2_mcp   "  ← no comparable"
di "  R²_MCP retransformado = " %6.4f r2_retrans "  ← comparable con MCO"

/* ── 7. Gráfico: residuos MCO vs PNB ─────────────────────────── */
di _n "  Generando gráfico de residuos MCO..."

estimates restore MCO
predict uhat_mco2, residuals

twoway ///
    (scatter uhat_mco2 PNB, mcolor(navy%70) msymbol(circle) msize(small)) ///
    (function y =  0.03*x, range(222 1549) lcolor(red) lpattern(dash) lwidth(medthin)) ///
    (function y = -0.03*x, range(222 1549) lcolor(red) lpattern(dash) lwidth(medthin)) ///
    , yline(0, lcolor(black) lwidth(thin)) ///
      title("Residuos MCO vs PNB" "Patrón de abanico → heteroscedasticidad") ///
      ytitle("Residuo MCO") xtitle("PNB{subscript:t}") ///
      legend(order(1 "Residuos" 2 "+σ·PNB" 3 "-σ·PNB")) ///
      scheme(s2color)

graph export "residuos_mco_pnb.png", replace width(1200)

/* ── 8. Comparación visual de estimaciones ───────────────────── */
estimates table MCO MCP_directo MCP_transform, ///
    b(%9.4f) se(%9.4f) stats(N r2) ///
    title("Comparación MCO vs MCP: coeficientes y ee")

di _n "════════════════════════════════════════════"
di    "  Fin del análisis — Ejercicio 11.6"
di    "════════════════════════════════════════════"
