* ============================================================
* TALLER ECONOMETRÍA — UPTC
* Emanuel Quintana Silva
*
* Modelo: ln(C) = B1 + B2·ln(I) + B3·ln(L) + B4·ln(A) + u
*
* Datos: Precio interno del cobre, EE.UU., 1951–1980
* Fuente: Gujarati & Porter (2010), Tabla 12.7
* ============================================================

clear all
set more off
capture log close
log using "taller_autocorrelacion.log", replace text

* ── INGRESAR DATOS ──────────────────────────────────────────
input año C I L A
1951  21.89   45.1   220.4  19.00
1952  22.29   50.9   259.5  19.41
1953  19.63   53.3   256.3  20.93
1954  22.85   53.6   249.3  21.78
1955  33.77   54.6   352.3  23.68
1956  39.18   61.1   329.1  26.01
1957  30.58   61.9   219.6  27.52
1958  26.30   57.9   234.8  26.89
1959  30.70   64.8   237.4  26.85
1960  32.10   66.2   245.8  27.23
1961  30.00   66.7   229.2  25.46
1962  30.80   72.2   233.9  23.88
1963  30.80   76.5   234.2  22.62
1964  32.60   81.7   347.0  23.72
1965  35.40   89.8   468.1  24.50
1966  36.60   97.8   555.0  24.50
1967  38.60  100.0   418.0  24.98
1968  42.20  106.3   525.2  25.58
1969  47.90  111.1   620.7  27.18
1970  58.20  107.8   588.6  28.72
1971  52.00  109.6   444.4  29.00
1972  51.20  109.7   427.8  26.67
1973  59.50  129.8   727.1  25.33
1974  77.30  129.3   877.6  34.06
1975  64.20  117.8   556.6  39.79
1976  69.60  129.8   780.6  44.49
1977  66.80  137.1   750.7  51.23
1978  66.50  145.2   709.8  54.42
1979  98.30  152.5   935.7  61.01
1980 101.40  147.1   940.9  70.87
end

* ── DECLARAR SERIE DE TIEMPO ────────────────────────────────
tsset año

* ── GENERAR LOGARITMOS ─────────────────────────────────────
gen lnC = ln(C)
gen lnI = ln(I)
gen lnL = ln(L)
gen lnA = ln(A)

label var lnC "ln(Precio cobre EE.UU.)"
label var lnI "ln(Índice producción industrial)"
label var lnL "ln(Precio cobre Londres)"
label var lnA "ln(Precio aluminio)"



* ============================================================
* (A) ESTIMACIÓN OLS DEL MODELO LOG-LOG
* ============================================================

regress lnC lnI lnL lnA
estimates store modelo_ols

* Guardar residuos y valores ajustados
predict uhat, residuals
predict yhat, xb

* ── Estadísticas de los residuos ────────────────────────────
summarize uhat, detail



* ============================================================
* (B) RESIDUOS — GRÁFICAS
* ============================================================

* Gráfica 1: residuos vs tiempo
twoway (line uhat año, lcolor(black) lwidth(medthin) lpattern(solid)) ///
       (yline 0, lcolor(black) lpattern(dash)), ///
    title("Residuos MCO vs Tiempo", color(black)) ///
    xtitle("Año") ytitle("Residuo ({it:û}{subscript:t})") ///
    graphregion(color(white)) plotregion(color(white)) ///
    legend(off) scheme(s2mono)

graph export "graf_residuos_tiempo.png", replace width(1200)

* Gráfica 2: residuo(t) vs residuo(t-1)
gen uhat_lag = L.uhat

twoway scatter uhat uhat_lag, ///
    mcolor(black) msymbol(circle_hollow) msize(small) ///
    title("Residuo(t) vs Residuo(t-1)", color(black)) ///
    xtitle("{it:û}(t-1)") ytitle("{it:û}(t)") ///
    graphregion(color(white)) plotregion(color(white)) ///
    scheme(s2mono)

graph export "graf_residuos_lag.png", replace width(900)



* ============================================================
* (C) ESTADÍSTICO DE DURBIN-WATSON
* ============================================================

regress lnC lnI lnL lnA
estat dwatson

* Valores críticos (k=3 regresores, n=30, alpha=5%):
*   dL = 1.21,  dU = 1.65
* d = 0.9428 < dL = 1.21  →  AUTOCORRELACIÓN POSITIVA

* Estimación de rho a partir de DW:
scalar rho_dw = 1 - 0.9428/2
display "rho estimado (vía DW) = " rho_dw



* ============================================================
* (D) PRUEBA DE RACHAS (Wald-Wolfowitz)
* ============================================================

runtest uhat, threshold(0)

* N(uhat <= 0) = 13,  N(uhat > 0) = 17
* Rachas observadas = 9
* z = -2.55,  Prob>|z| = 0.01  →  RECHAZA H0 (no aleatoriedad)



* ============================================================
* (E) PRUEBA BREUSCH-GODFREY (Multiplicador de Lagrange)
* ============================================================

regress lnC lnI lnL lnA

* LM orden 1
bgodfrey, lags(1)

* LM orden 2
bgodfrey, lags(2)

* chi2(1) = 8.838  p=0.003  →  RECHAZA H0 (AR 1 presente)
* chi2(2) = 12.643 p=0.002  →  RECHAZA H0 (confirma AR)



* ============================================================
* (F) PRUEBA DE CHOW (Cambio estructural, punto de quiebre 1965)
* ============================================================

* Regresión muestra completa
regress lnC lnI lnL lnA
scalar SCR_total = e(rss)
scalar k = e(df_m) + 1        /* k = 4 parámetros */

* Sub-muestra 1: 1951–1965
regress lnC lnI lnL lnA if año <= 1965
scalar SCR1 = e(rss)
scalar n1   = e(N)

* Sub-muestra 2: 1966–1980
regress lnC lnI lnL lnA if año > 1965
scalar SCR2 = e(rss)
scalar n2   = e(N)

* Estadístico F de Chow
scalar SCR_ur   = SCR1 + SCR2
scalar F_chow   = ((SCR_total - SCR_ur) / k) / (SCR_ur / (n1 + n2 - 2*k))
scalar p_chow   = Ftail(k, n1+n2-2*k, F_chow)

display _newline "── PRUEBA DE CHOW ──────────────────────────"
display "SCR restringida  = " SCR_total
display "SCR sub-muestra1 = " SCR1
display "SCR sub-muestra2 = " SCR2
display "SCR no restringida (SCR1+SCR2) = " SCR_ur
display "F Chow           = " F_chow
display "p-valor          = " p_chow
display "F crítico F(4,22) al 5% ≈ 2.82"
display "Decisión: " cond(F_chow > 2.82, "RECHAZA H0 — hay cambio estructural", ///
                          "NO rechaza H0 — parámetros estables")



* ============================================================
* DIAGNÓSTICOS ADICIONALES
* ============================================================

regress lnC lnI lnL lnA

* VIF – Multicolinealidad
vif

* Heterocedasticidad (Breusch-Pagan)
estat hettest

* Normalidad de residuos (Skewness-Kurtosis)
sktest uhat



* ============================================================
* CORRECCIÓN POR AUTOCORRELACIÓN (MCG factible)
* Cochrane-Orcutt
* ============================================================

prais lnC lnI lnL lnA, corc

* Prais-Winsten (más eficiente, conserva primera observación)
prais lnC lnI lnL lnA



* ── FIN ──────────────────────────────────────────────────────
log close
