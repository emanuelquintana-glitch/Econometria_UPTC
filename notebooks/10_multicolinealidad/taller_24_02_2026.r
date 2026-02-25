# =============================================================================
#  ANÁLISIS ECONOMÉTRICO COMPLETO — MODELO LOG-LOG DE INFLACIÓN
#  Colombia 1975–2005
#  Autor     : Emanuel Quintana Silva
#  Institución: Universidad Pedagógica y Tecnológica de Colombia (UPTC)
#  Docente   : Profesora Rosalba Gil Galindo
#  Curso     : Econometría
#  Resultados verificados con Stata 17 (ver documento adjunto)
# =============================================================================
#
#  COMANDOS STATA REPLICADOS EN R:
#  ─────────────────────────────────────────────────────────────────────────────
#  gen lninflacion = ln(inflacion)   →  log()
#  gen lnpib       = ln(pib)         →  log()
#  gen lnti        = ln(ti)          →  log()
#  gen lnm         = ln(m)           →  log()
#  reg lninflacion lnpib lnti lnm    →  lm()  + summary()
#  correlate lnpib lnti lnm          →  cor()
#  vif                               →  car::vif()
#  reg lninflacion lnpib lnti        →  lm() modelo sin lnM
#  reg lninflacion lnti lnm          →  lm() modelo sin lnPIB
#  reg lninflacion lnpib lnm         →  lm() modelo sin lnTI
#  (Farrar-Glauber, Theil, RESET, Shapiro, DW → implementados manualmente)
# =============================================================================

# ── PAQUETES ─────────────────────────────────────────────────────────────────
# install.packages(c("car","lmtest","ggplot2","corrplot","stargazer","sandwich","MASS"))
suppressPackageStartupMessages({
  library(car)        # vif()
  library(lmtest)     # dwtest(), bgtest(), bptest(), resettest()
  library(ggplot2)
  library(corrplot)
  library(stargazer)
  library(sandwich)   # vcovHAC()
  library(MASS)       # stepAIC()
})
options(scipen = 999, digits = 7)

cat("═══════════════════════════════════════════════════════════════════════\n")
cat("  ANÁLISIS ECONOMÉTRICO — INFLACIÓN COLOMBIA 1975-2005\n")
cat("  Emanuel Quintana Silva | UPTC\n")
cat("  Docente: Profesora Rosalba Gil Galindo\n")
cat("═══════════════════════════════════════════════════════════════════════\n\n")

# ============================================================================
#  §0  BASE DE DATOS
#      Stata: input anios inflacion pib ti m
# ============================================================================
datos <- data.frame(
  anios     = 1975:2005,
  inflacion = c(17.70, 25.70, 28.40, 18.80, 28.80, 26.80, 26.40, 24.00,
                16.60, 18.30, 22.50, 21.00, 24.00, 28.10, 26.10, 32.40,
                26.80, 25.10, 22.60, 22.60, 19.50, 21.60, 17.70, 16.70,
                 9.23,  8.75,  7.65,  6.99,  6.49,  5.50,  4.85),
  pib       = c(405108, 424263, 441906, 479335, 505119, 525765, 537736,
                542836, 551380, 569855, 587561, 621781, 655164, 681791,
                705088, 24030173, 31130592, 39730752, 52271688, 67532862,
                84439102, 100711389, 121707501, 140483322, 151565005,
                174896258, 188558786, 203451414, 228516603, 239439697,
                251722954),
  ti        = c(23.80, 22.40, 22.90, 25.90, 36.50, 41.50, 35.70, 37.70,
                37.30, 34.60, 35.90, 32.10, 34.20, 31.80, 34.00, 38.20,
                37.10, 27.20, 25.60, 29.50, 32.00, 31.43, 24.09, 32.55,
                21.60, 12.14, 12.47,  8.92,  7.80,  7.80,  7.03),
  m         = c(51.856, 82.703, 103.503, 134.890, 167.593, 214.287,
                259.709, 325.699, 408.925, 503.795, 642.184, 788.470,
                1048.259, 1318.549, 1702.105, 2140.965, 2842.019, 4013.105,
                5214.800, 6419.000, 7717.800, 8992.800, 10948.000, 10526.500,
                12856.800, 16720.800, 18737.000, 21635.600, 24918.300,
                29113.700, 26954.400)
)

# ── Stata: gen lninflacion=ln(inflacion), gen lnpib=ln(pib), etc. ───────────
datos$lninflacion <- log(datos$inflacion)
datos$lnpib       <- log(datos$pib)
datos$lnti        <- log(datos$ti)
datos$lnm         <- log(datos$m)
n <- nrow(datos)   # n = 31

cat("── §0  Estadísticas descriptivas ──────────────────────────────────────\n")
print(summary(datos[, c("inflacion","pib","ti","m","lninflacion","lnpib","lnti","lnm")]))


# ============================================================================
#  §1  PUNTO 1 — MODELO LOG-LOG (reg en Stata)
#  Stata: reg lninflacion lnpib lnti lnm
# ============================================================================
cat("\n\n════════════════════════════════════════════════════════════════════════\n")
cat("  PUNTO 1: ESTIMACIÓN MCO — MODELO LOG-LOG\n")
cat("  ln(inflacion) = β₁ + β₂·ln(pib) + β₃·ln(ti) + β₄·ln(m) + u\n")
cat("════════════════════════════════════════════════════════════════════════\n")

# ── §1A  ÁLGEBRA MATRICIAL EXPLÍCITA ─────────────────────────────────────────
cat("\n── §1A  Construcción matricial β̂ = (X'X)⁻¹ X'y ─────────────────────\n")
y  <- matrix(datos$lninflacion, ncol = 1)
X  <- cbind(1, datos$lnpib, datos$lnti, datos$lnm)
colnames(X) <- c("_cons", "lnpib", "lnti", "lnm")
k  <- ncol(X); kr <- k - 1

XtX      <- t(X) %*% X
XtX_inv  <- solve(XtX)
Xty      <- t(X) %*% y
beta_hat <- XtX_inv %*% Xty

cat(sprintf("  X: %d×%d  |  y: %d×1\n\n", n, k, n))
cat("  X'X:\n");       print(round(XtX, 4))
cat("\n  (X'X)⁻¹:\n"); print(round(XtX_inv, 10))
cat("\n  X'y:\n");      print(round(Xty, 6))
cat("\n  β̂ = (X'X)⁻¹·X'y:\n"); print(round(beta_hat, 7))

# ── §1B  lm() — REPLICA EXACTA DE STATA ─────────────────────────────────────
cat("\n── §1B  reg lninflacion lnpib lnti lnm  ────────────────────────────────\n")
modelo <- lm(lninflacion ~ lnpib + lnti + lnm, data = datos)
sm     <- summary(modelo)

# Estadísticos ANOVA
SCE  <- sum((fitted(modelo) - mean(datos$lninflacion))^2)
SCR  <- sum(residuals(modelo)^2)
SCT  <- SCE + SCR
MSE  <- SCE / kr
MSR  <- SCR / (n - k)
RMSE <- sqrt(MSR)
R2   <- sm$r.squared
R2a  <- sm$adj.r.squared
Fval <- sm$fstatistic[1]
Fpv  <- pf(Fval, sm$fstatistic[2], sm$fstatistic[3], lower.tail = FALSE)

# Tabla ANOVA (idéntica a Stata)
cat(sprintf("\n  Source   |         SS |  df |          MS    Number obs = %d\n", n))
cat(sprintf("  ---------|------------|-----|----------      F(%d,%d)    = %.2f\n", kr, n-k, Fval))
cat(sprintf("  Model    | %10.8f |   %d | %10.8f   Prob > F   = %.4f\n", SCE, kr, MSE, Fpv))
cat(sprintf("  Residual | %10.8f |  %d | %10.8f   R-squared  = %.4f\n", SCR, n-k, MSR, R2))
cat(sprintf("  ---------|------------|-----|----------      Adj R-sq   = %.4f\n", R2a))
cat(sprintf("  Total    | %10.8f |  %d | %10.8f   Root MSE   = %.4f\n\n", SCT, n-1, SCT/(n-1), RMSE))

# Tabla de coeficientes con IC 95% (idéntica a Stata)
ctbl <- sm$coefficients
ci95 <- confint(modelo, level = 0.95)
cat(sprintf("  %-14s %11s %10s %7s %7s  %12s %12s\n",
            "lninflacion","Coefficient","Std.err.","t","P>|t|","[95% conf","interval]"))
cat(paste0("  ", strrep("-", 76)), "\n")
orden <- c("lnpib","lnti","lnm","(Intercept)")
for (nm in orden) {
  lbl <- ifelse(nm == "(Intercept)", "_cons", nm)
  sig <- ifelse(ctbl[nm,4]<.001,"***",ifelse(ctbl[nm,4]<.01,"** ",
         ifelse(ctbl[nm,4]<.05,"*  ",ifelse(ctbl[nm,4]<.10,".  ","   "))))
  cat(sprintf("  %-14s %11.7f %10.7f %7.2f %7.3f  %12.7f %12.7f  %s\n",
              lbl, ctbl[nm,1], ctbl[nm,2], ctbl[nm,3], ctbl[nm,4],
              ci95[nm,1], ci95[nm,2], sig))
}
cat("  Signif.codes: ***<.001  **<.01  *<.05  .<.10\n")

# Verificación matricial vs lm()
cat("\n── §1C  Verificación: matricial = lm() ─────────────────────────────────\n")
print(data.frame(
  `β̂_matricial` = round(as.vector(beta_hat), 7),
  `β̂_lm`        = round(coef(modelo), 7),
  Coincide      = abs(as.vector(beta_hat) - coef(modelo)) < 1e-7,
  row.names     = names(coef(modelo))
))

# Interpretación de elasticidades
cat("\n── §1D  Elasticidades (interpretación log-log) ──────────────────────────\n")
b <- coef(modelo)
cat(sprintf("  β₂(lnpib) = %+.7f → +1%% PIB ⟹ %+.4f%% inflación  [p=%.3f]\n",
            b["lnpib"], b["lnpib"], ctbl["lnpib",4]))
cat(sprintf("  β₃(lnti)  = %+.7f → +1%% TI  ⟹ %+.4f%% inflación  [p=%.3f ***]\n",
            b["lnti"], b["lnti"], ctbl["lnti",4]))
cat(sprintf("  β₄(lnm)   = %+.7f → +1%% M   ⟹ %+.4f%% inflación  [p=%.3f]\n",
            b["lnm"], b["lnm"], ctbl["lnm",4]))


# ============================================================================
#  §2  PUNTO 2 — MULTICOLINEALIDAD
# ============================================================================
cat("\n\n════════════════════════════════════════════════════════════════════════\n")
cat("  PUNTO 2: DIAGNÓSTICO DE MULTICOLINEALIDAD\n")
cat("════════════════════════════════════════════════════════════════════════\n")

# ── §2A  SÍNTOMA CLÁSICO (t vs F) ────────────────────────────────────────────
cat("\n── §2A  Verificación individual (t) y global (F) ────────────────────────\n")
cat(sprintf("  F(%d,%d) = %.2f  p = %.4f  → %s\n",
            kr, n-k, Fval, Fpv, "RECHAZA H₀: significativo global"))
cat(sprintf("  R²       = %.4f            → R² ALTO (> 0.80)\n\n", R2))
cat(sprintf("  %-10s %11s %9s %8s %8s  Resultado\n","Variable","Coef","SE","t","p"))
cat(paste0("  ", strrep("-", 70)), "\n")
for (nm in c("lnpib","lnti","lnm")) {
  dec <- ifelse(ctbl[nm,4]<.001,"*** sig al 0.1%",
         ifelse(ctbl[nm,4]<.05,"** sig al 5%",
         ifelse(ctbl[nm,4]<.10,". marginal (10%)","NO significativo")))
  cat(sprintf("  %-10s %11.7f %9.7f %8.2f %8.3f  %s\n",
              nm, ctbl[nm,1], ctbl[nm,2], ctbl[nm,3], ctbl[nm,4], dec))
}
cat("\n  ► SÍNTOMA CLÁSICO: R²=0.8585 alto + F=54.62 sig + lnpib p=0.368 NO sig\n")
cat("    → INDICIO DE MULTICOLINEALIDAD entre lnpib y lnm\n")

# ── §2B  CORRELACIONES — Stata: correlate lnpib lnti lnm ────────────────────
cat("\n── §2B  Correlaciones — [Stata: correlate lnpib lnti lnm] ──────────────\n")
cor_reg <- cor(datos[, c("lnpib","lnti","lnm")])
cat("\n             |    lnpib     lnti      lnm\n")
cat("  -----------+---------------------------\n")
labs <- c("lnpib","lnti ","lnm  ")
for (i in 1:3) {
  cat(sprintf("  %11s |", labs[i]))
  for (j in 1:3) {
    if (j <= i) cat(sprintf("%9.4f", cor_reg[i,j])) else cat("         ")
  }
  cat("\n")
}

cat("\n  Significancia de correlaciones entre pares:\n")
pairs_list <- list(c("lnpib","lnti"), c("lnpib","lnm"), c("lnti","lnm"))
for (pr in pairs_list) {
  ct <- cor.test(datos[[pr[1]]], datos[[pr[2]]])
  cat(sprintf("  r(%s, %s) = %7.4f  t=%7.4f  p=%.6f  %s\n",
              pr[1], pr[2], ct$estimate, ct$statistic, ct$p.value,
              ifelse(ct$p.value < .05, "★ Significativa", "No sig.")))
}
cat("  ► r(lnpib, lnm) = 0.9385 → correlación muy alta: fuente de colinealidad\n")

# ── §2C  VIF — Stata: vif ────────────────────────────────────────────────────
cat("\n── §2C  VIF [Stata: vif] ────────────────────────────────────────────────\n")
vif_v <- vif(modelo)
tol_v <- 1 / vif_v

vif_manual <- function(dv, dat) {
  otros <- setdiff(c("lnpib","lnti","lnm"), dv)
  m_aux <- lm(as.formula(paste(dv, "~", paste(otros, collapse="+"))), data=dat)
  R2a   <- summary(m_aux)$r.squared
  list(R2=R2a, VIF=1/(1-R2a), TOL=1-R2a)
}

cat(sprintf("\n  %-10s | %9s | %8s | %9s | %9s | Diagnóstico\n",
            "Variable","R²_aux","TOL","VIF","1/VIF"))
cat(paste0("  ", strrep("-", 65)), "\n")
for (vn in c("lnpib","lnti","lnm")) {
  vm <- vif_manual(vn, datos)
  vc <- vif_v[vn]; tc <- tol_v[vn]
  dx <- ifelse(vc > 10,"GRAVE",ifelse(vc > 5,"MODERADO-ALTO","LEVE"))
  cat(sprintf("  %-10s | %9.4f | %8.4f | %9.4f | %9.4f | %s\n",
              vn, vm$R2, vm$TOL, vc, tc, dx))
}
cat(sprintf("  %-10s | %9s | %8s | %9.2f | %9s |\n", "Mean VIF","","",mean(vif_v),""))
cat("  ► lnpib: VIF=8.72  lnm: VIF=8.43  →  Moderado-alto (umbral>10)\n")
cat("    La regla estricta VIF>10 no se excede, pero VIF≈8-9 ya es problemático\n")

# ── §2D  FARRAR-GLAUBER ───────────────────────────────────────────────────────
cat("\n── §2D  Test de Farrar-Glauber ──────────────────────────────────────────\n")
cat("  H₀: det(R)=1 (no existe multicolinealidad)\n\n")
p_r     <- 3
detR    <- det(cor_reg)
lndetR  <- log(detR)
factor  <- n - 1 - (2*p_r+5)/6
chi2_FG <- -factor * lndetR
gl_FG   <- as.integer(p_r*(p_r-1)/2)
pval_FG <- pchisq(chi2_FG, df=gl_FG, lower.tail=FALSE)

cat(sprintf("  det(R)              = %.8f\n", detR))
cat(sprintf("  ln[det(R)]          = %.6f\n", lndetR))
cat(sprintf("  n-1-(2p+5)/6        = %.4f\n", factor))
cat(sprintf("  χ²_FG               = %.4f\n", chi2_FG))
cat(sprintf("  Grados de libertad  = %d\n", gl_FG))
cat(sprintf("  p-valor             = %.8f\n", pval_FG))
cat(sprintf("  Decisión: %s\n",
            ifelse(pval_FG < .05,
                   "RECHAZA H₀ → Multicolinealidad estadísticamente significativa",
                   "No rechaza H₀")))

# Correlaciones parciales (2ª etapa Farrar-Glauber)
cat("\n  Correlaciones parciales r(ij|resto):\n")
R_inv  <- solve(cor_reg)
vregs  <- c("lnpib","lnti","lnm")
for (i in 1:2) for (j in (i+1):3) {
  rp   <- -R_inv[i,j] / sqrt(R_inv[i,i]*R_inv[j,j])
  dfc  <- n - p_r - 1
  t_rp <- rp * sqrt(dfc/(1-rp^2))
  p_rp <- 2 * pt(abs(t_rp), df=dfc, lower.tail=FALSE)
  cat(sprintf("  r(%s,%s | resto) = %7.4f  t=%8.4f  p=%.4f  %s\n",
              vregs[i], vregs[j], rp, t_rp, p_rp,
              ifelse(p_rp<.05,"★ SIGNIFICATIVA","No sig.")))
}
cat("  ► r(lnpib,lnm|lnti) = 0.9033 (t=10.94, p≈0) → fuente principal\n")

# ── §2E  THEIL ────────────────────────────────────────────────────────────────
cat("\n── §2E  Test de Theil (criterio R²) ─────────────────────────────────────\n")
cat(sprintf("  R²_principal = %.4f\n\n", R2))
cat(sprintf("  %-10s | %12s | %24s | Conclusión\n","Variable","R²_auxiliar","R²_aux > R²_princ?"))
cat(paste0("  ", strrep("-", 65)), "\n")
for (vn in c("lnpib","lnti","lnm")) {
  vm   <- vif_manual(vn, datos)
  flag <- vm$R2 > R2
  cat(sprintf("  %-10s | %12.4f | %24s | %s\n",
              vn, vm$R2,
              ifelse(flag,"SÍ ★ ALERTA","No"),
              ifelse(flag,"COLINEALIDAD PROBLEMÁTICA","Sin problema grave")))
}
cat("  ► lnpib: 0.8853 > 0.8585 → ALERTA\n")
cat("    lnm  : 0.8814 > 0.8585 → ALERTA\n")
cat("    lnti : 0.3799 < 0.8585 → Sin problema\n")


# ============================================================================
#  §3  PUNTO 3 — ELIMINACIÓN DE VARIABLES
#  Stata: reg lninflacion lnpib lnti
#         reg lninflacion lnti lnm
#         reg lninflacion lnpib lnm
# ============================================================================
cat("\n\n════════════════════════════════════════════════════════════════════════\n")
cat("  PUNTO 3: ELIMINACIÓN DE VARIABLES Y SESGO DE ESPECIFICACIÓN\n")
cat("════════════════════════════════════════════════════════════════════════\n")

m_sinM   <- lm(lninflacion ~ lnpib + lnti, data=datos)
m_sinPIB <- lm(lninflacion ~ lnti  + lnm,  data=datos)
m_sinTI  <- lm(lninflacion ~ lnpib + lnm,  data=datos)

modelos_list <- list(
  list(m=m_sinM,   lab="Sin lnM   (lnpib+lnti)", vif_nms=c("lnpib","lnti")),
  list(m=m_sinPIB, lab="Sin lnPIB (lnti+lnm)",   vif_nms=c("lnti","lnm")),
  list(m=m_sinTI,  lab="Sin lnTI  (lnpib+lnm)",   vif_nms=c("lnpib","lnm"))
)

# Réplica tabla Stata para cada modelo reducido
for (ml in modelos_list) {
  sm_ <- summary(ml$m)
  SCE_<- sum((fitted(ml$m)-mean(datos$lninflacion))^2)
  SCR_<- sum(residuals(ml$m)^2); SCT_<- SCE_+SCR_
  n_  <- nrow(datos); k_  <- length(coef(ml$m)); kr_ <- k_-1
  MSE_<- SCE_/kr_; MSR_<- SCR_/(n_-k_); RMSE_<- sqrt(MSR_)
  R2_ <- sm_$r.squared; R2a_<- sm_$adj.r.squared
  Fv_ <- sm_$fstatistic[1]; Fp_ <- pf(Fv_,sm_$fstatistic[2],sm_$fstatistic[3],lower.tail=F)
  ct_ <- sm_$coefficients; ci_ <- confint(ml$m)
  cat(sprintf("\n── Modelo %s ─────────────\n", ml$lab))
  cat(sprintf("  F(%d,%d)=%.2f p=%.4f  R²=%.4f  R²adj=%.4f  RMSE=%.5f\n",
              kr_,n_-k_,Fv_,Fp_,R2_,R2a_,RMSE_))
  cat(sprintf("  %-10s %11s %10s %7s %7s  [95%% CI]\n","Variable","Coef","Std.Err","t","p"))
  for (nm in rownames(ct_)) {
    lbl <- ifelse(nm=="(Intercept)","_cons",nm)
    cat(sprintf("  %-10s %11.7f %10.7f %7.2f %7.3f  [%.7f, %.7f]\n",
                lbl, ct_[nm,1], ct_[nm,2], ct_[nm,3], ct_[nm,4],
                ci_[nm,1], ci_[nm,2]))
  }
  vif_red <- vif(ml$m)
  cat("  VIF: "); for(v in ml$vif_nms) cat(sprintf("%s=%.4f  ",v,vif_red[v])); cat("\n")
}

# ── §3B  SESGO DE OMISIÓN ─────────────────────────────────────────────────────
cat("\n── §3B  Cálculo explícito del sesgo de omisión ──────────────────────────\n")
cat("  Fórmula: E[α̂₂] = β₂ + β₄·b₄₂  donde b₄₂=Cov(lnpib,lnm)/Var(lnpib)\n\n")
cov_pm <- cov(datos$lnpib, datos$lnm)
var_p  <- var(datos$lnpib)
b42    <- cov_pm / var_p
b4     <- coef(modelo)["lnm"]
sesgo  <- b4 * b42

cat(sprintf("  Cov(lnpib, lnm)  = %.6f\n", cov_pm))
cat(sprintf("  Var(lnpib)       = %.6f\n", var_p))
cat(sprintf("  b₄₂              = %.7f\n", b42))
cat(sprintf("  β₄ (lnm pleno)   = %.7f\n", b4))
cat(sprintf("  Sesgo TEÓRICO    = β₄·b₄₂ = %.7f\n\n", sesgo))
cat(sprintf("  β₂(lnpib) COMPLETO    = %+.7f\n", coef(modelo)["lnpib"]))
cat(sprintf("  α₂(lnpib) SIN lnm     = %+.7f\n", coef(m_sinM)["lnpib"]))
cat(sprintf("  Diferencia observada   = %+.7f\n", coef(m_sinM)["lnpib"]-coef(modelo)["lnpib"]))
cat(sprintf("  Sesgo teórico (fórm.)  = %+.7f\n", sesgo))
cat("  ► La diferencia observada ≈ sesgo teórico → validación de la fórmula OVB\n")

# ── §3C  RESET DE RAMSEY ─────────────────────────────────────────────────────
cat("\n── §3C  Test RESET de Ramsey [Stata: ovtest] ────────────────────────────\n")
for (ml in modelos_list) {
  rc_ <- resettest(ml$m, power=2:3, type="fitted")
  cat(sprintf("  %-30s: F=%.4f p=%.4f → %s\n",
              ml$lab, rc_$statistic, rc_$p.value,
              ifelse(rc_$p.value<.05,"⚠ Mala especificación","Bien especificado")))
}
rc_c <- resettest(modelo, power=2:3, type="fitted")
cat(sprintf("  %-30s: F=%.4f p=%.4f → %s\n",
            "Modelo COMPLETO", rc_c$statistic, rc_c$p.value,
            ifelse(rc_c$p.value<.05,"⚠ Mala especificación","Bien especificado")))


# ============================================================================
#  §4  PUNTO 4 — COHERENCIA TEÓRICA
# ============================================================================
cat("\n\n════════════════════════════════════════════════════════════════════════\n")
cat("  PUNTO 4: COHERENCIA TEÓRICA\n")
cat("════════════════════════════════════════════════════════════════════════\n\n")

cat("  Resultados del modelo completo (Stata verificado):\n")
cat("  β₁(_cons)  =  0.3409  p=0.545  (intercepto)\n")
cat("  β₂(lnpib)  = +0.0391  p=0.368  (no sig.)   Esperado teórico: +\n")
cat("  β₃(lnti)   = +0.8361  p=0.000  (***)        Esperado teórico: −\n")
cat("  β₄(lnm)    = −0.1026  p=0.089  (marginal)   Esperado teórico: +\n\n")

teorias <- data.frame(
  Variable  = c("lnpib","lnti","lnm"),
  Esperado  = c("+",    "−",   "+"),
  Observado = c("+",    "+",   "−"),
  Coherente = c("SÍ ✓", "NO ✗","NO ✗"),
  Marco     = c("Demanda Agregada / Phillips",
                "IS-LM (política contractiva)",
                "Teoría Cuantitativa MV=PQ")
)
for (i in 1:nrow(teorias)) {
  cat(sprintf("  %-8s | Esp=%s | Obs=%s | %s | %s\n",
              teorias$Variable[i], teorias$Esperado[i], teorias$Observado[i],
              teorias$Coherente[i], teorias$Marco[i]))
}

cat("\n  ANÁLISIS DE INCOHERENCIAS:\n")
cat("  β₃(lnti)=+0.8361 (positivo ≠ negativo esperado por IS-LM):\n")
cat("    → En Colombia 1975-1989 la TI fue administrada bajo represión financiera.\n")
cat("      Subía PORQUE la inflación subía (señal, no instrumento). La relación\n")
cat("      causal se invierte respecto al canal IS-LM estándar.\n\n")
cat("  β₄(lnm)=−0.1026 (negativo ≠ positivo esperado por TCD):\n")
cat("    → Efecto de la multicolinealidad severa r(lnpib,lnm)=0.9385.\n")
cat("      El modelo no separa los efectos individuales de PIB y M.\n")


# ============================================================================
#  §5  SUPUESTOS MCO
# ============================================================================
cat("\n\n════════════════════════════════════════════════════════════════════════\n")
cat("  §5  SUPUESTOS MCO\n")
cat("════════════════════════════════════════════════════════════════════════\n\n")

sw  <- shapiro.test(residuals(modelo))
bp  <- bptest(modelo)
dw  <- dwtest(modelo)
bg2 <- bgtest(modelo, order=2)

cat(sprintf("  Shapiro-Wilk (Normalidad)   : W=%.4f  p=%.4f  → %s\n",
            sw$statistic, sw$p.value,
            ifelse(sw$p.value>.05,"Normalidad ✓","NO normales ✗")))
cat(sprintf("  Breusch-Pagan (Homoced.)    : χ²=%.4f p=%.4f  → %s\n",
            bp$statistic, bp$p.value,
            ifelse(bp$p.value>.05,"Homocedasticidad ✓","Heterocedasticidad ✗")))
cat(sprintf("  Durbin-Watson (Autocorr.)   : DW=%.4f  p=%.4f  → %s\n",
            dw$statistic, dw$p.value,
            ifelse(dw$p.value>.05,"Sin autocorrelación ✓","Posible autocorrelación ✗")))
cat(sprintf("  Breusch-Godfrey(2)          : χ²=%.4f p=%.4f  → %s\n",
            bg2$statistic, bg2$p.value,
            ifelse(bg2$p.value>.05,"Sin autocorrelación ✓","Autocorrelación ✗")))

# Errores robustos HAC
cat("\n  Errores HAC (Newey-West) — corrección por autocorrelación:\n")
print(coeftest(modelo, vcov=vcovHAC(modelo)))


# ============================================================================
#  §6  GRÁFICOS DIAGNÓSTICOS
# ============================================================================
pdf("/tmp/graficos_EQS_UPTC.pdf", width=16, height=10)
par(mfrow=c(2,3), mar=c(4,4,3,2))

# 1. Inflación en el tiempo
plot(datos$anios, datos$inflacion, type="l", lwd=2.5, col="#8B0000",
     main="Inflación Colombia 1975-2005\n(Emanuel Quintana Silva | UPTC)",
     xlab="Año", ylab="Inflación (%)", ylim=c(0,40))
points(datos$anios, datos$inflacion, pch=19, col="#8B0000", cex=0.7)
abline(v=c(1990,1999), lty=2, col="gray50", lwd=1.5)
text(c(1990,1999), c(38,38), c("Apertura\n1990","Metas\n1999"),
     cex=0.65, col="gray40")
grid(col="gray90")

# 2. ln(inflacion) real vs ajustado
plot(datos$anios, datos$lninflacion, type="l", lwd=2, col="#003366",
     main="ln(INF): Real vs Ajustado\nModelo Log-Log MCO",
     xlab="Año", ylab="ln(Inflación)")
lines(datos$anios, fitted(modelo), lwd=2, lty=2, col="#CC0000")
legend("topright", c("Real","Ajustado"), col=c("#003366","#CC0000"),
       lty=c(1,2), lwd=2, cex=0.8, bty="n")
grid(col="gray90")

# 3. Residuos vs ajustados
plot(fitted(modelo), residuals(modelo), pch=19, col="#003366",
     main="Residuos vs Valores Ajustados",
     xlab=expression(hat(y)), ylab="Residuos")
abline(h=0, col="red", lwd=2)
abline(h=c(-2,2)*sd(residuals(modelo)), lty=2, col="orange")
idx <- which(abs(residuals(modelo)) > 1.8*sd(residuals(modelo)))
if(length(idx)>0) text(fitted(modelo)[idx], residuals(modelo)[idx],
                        datos$anios[idx], cex=0.65, pos=4)
grid(col="gray90")

# 4. QQ Plot
qqnorm(residuals(modelo), pch=19, col="#003366",
       main=sprintf("Normal Q-Q  (Shapiro-Wilk W=%.3f, p=%.3f)",
                    sw$statistic, sw$p.value))
qqline(residuals(modelo), col="red", lwd=2)

# 5. Cook's Distance
cd <- cooks.distance(modelo)
plot(cd, type="h", col="#003366", lwd=1.5,
     main="Distancia de Cook\n(obs. influyentes)",
     xlab="Índice observación", ylab="Cook's D")
abline(h=4/n, col="red", lwd=2, lty=2)
text(which(cd > 4/n), cd[which(cd > 4/n)],
     datos$anios[which(cd > 4/n)], cex=0.7, pos=4, col="red")

# 6. lnpib vs lnm (evidencia visual de colinealidad)
par(mar=c(4,4,3,4))
plot(datos$anios, datos$lnpib, type="l", lwd=2, col="#003366",
     main="lnPIB vs lnM — Colinealidad Visual\nr(lnpib,lnm)=0.9385",
     xlab="Año", ylab="ln(PIB)")
par(new=TRUE)
plot(datos$anios, datos$lnm, type="l", lwd=2, col="#B88835",
     axes=FALSE, xlab="", ylab="")
axis(4, col="#B88835", col.axis="#B88835")
mtext("ln(M)", side=4, line=2.5, col="#B88835")
legend("topleft", c("ln(PIB)","ln(M)"),
       col=c("#003366","#B88835"), lwd=2, cex=0.8, bty="n")

dev.off()
cat("\n  Gráficos → /tmp/graficos_EQS_UPTC.pdf\n")

cat("\n\n════════════════════════════════════════════════════════════════════════\n")
cat("  FIN DEL ANÁLISIS\n")
cat("  Emanuel Quintana Silva | UPTC\n")
cat("  Con gratitud a la Profesora Rosalba Gil Galindo\n")
cat("════════════════════════════════════════════════════════════════════════\n")
