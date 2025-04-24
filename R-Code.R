# Installer les packages nécessaires (décommentez la ligne suivante si les packages ne sont pas installés)
# install.packages(c("car", "corrplot", "ggplot2", "lmtest", "sandwich", "olsrr", "MASS", "stargazer", "readr", "AER"))

# Charger les bibliothèques nécessaires
library(readr)    # Pour la gestion des fichiers CSV
library(car)      # Pour les outils de régression et le VIF
library(AER)      # Pour les tests et modèles économétriques
library(lmtest)   # Pour les tests de spécifications des modèles
library(sandwich) # Pour l'estimation de la variance robuste
library(olsrr)    # Pour les outils de diagnostic du modèle
library(corrplot) # Pour la visualisation des matrices de corrélation
library(MASS)     # Contient des fonctions pour les modèles statistiques
library(stargazer) # Pour afficher les résultats sous forme de tableau
library(ggplot2)  # Pour la visualisation des données

# Nettoyage de l'environnement de travail pour éviter les conflits
rm(list = ls())

# Création d'un data frame avec les données économiques
data <- data.frame(
  `effective.exchange.rate` = c(100.23875, 100.23489, 100.22141, 100.19603, 100.11817, 100.04099, 100.00065, 100.00136, 100.00070, 99.99810, 99.99955, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000, 100.0000 ),
  `Household.saving.rate` = c(14.34, 14.45, 13.71, 14.05, 14.41, 14.38, 15.73, 15.43, 15.05, 15.19, 13.87, 14.15, 13.61, 13.41, 13.67, 13.54, 14.24, 20.03, 18.67, 16.46, 16.52),
  `GDP` = c(1, 2.9, 1.9, 2.7, 2.5, 0.4, -2.8, 2, 2.4, 0.2, 0.8, 1, 1.1, 0.9, 2.1, 1.6, 2, -7.4, 6.9, 2.6, 0.9),
  `Unemployment.Rate` = c(8.500, 8.875, 8.875, 8.850, 8.025, 7.425, 9.125, 9.275, 9.225, 9.775, 10.275, 10.250, 10.375, 10.075, 9.425, 9.025, 8.425, 8.025, 7.900, 7.350, 7.350),
  `Government.surplus.or.deficit` = c(-4.1, -3.6, -3.5, -2.7, -3.0, -3.5, -7.4, -7.2, -5.3, -5.2, -4.9, -4.6, -3.9, -3.8, -3.4, -2.3, -2.4, -8.9, -6.6, -4.7, -5.5),
  `NetTaxReceipts` = c(44.3, 44.4, 44.7, 45.1, 44.6, 44.5, 44.1 ,44.2, 45.3, 46.5, 47.4, 47.6, 47.7, 47.7, 48.5, 48.3, 47.3, 47.4, 46.9, 47.6, 45.6),
  `InflationRate` = c(2.18, 2.35, 1.9, 1.89, 1.6, 3.17, 0.11, 1.7, 2.3, 2.23, 0.99, 0.62, 0.08, 0.31, 1.17, 2.1, 1.31, 0.54, 2.08, 5.9, 5.7),
  `year` = c(2003, 2004, 2005, 2006, 2007, 2008, 2009, 2010, 2011, 2012, 2013, 2014, 2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023)
)

# Création d'un sous-ensemble de données avec des colonnes sélectionnées
mon_data_frame <- data.frame(
  year = data$`year`,
  effective.exchange.rate = data$`effective.exchange.rate`,
  Household.saving.rate = data$`Household.saving.rate`, 
  InflationRate = data$`InflationRate`,
  Unemployment.Rate = data$`Unemployment.Rate`,
  NetTaxReceipts = data$`NetTaxReceipts`,
  GDP = data$`GDP`,
  Government.surplus.or.deficit = data$`Government.surplus.or.deficit`
)

# Affichage du data frame
mon_data_frame

# Résumé statistique des données
summary(mon_data_frame)

# Visualisation de l'évolution du déficit public en France avec ggplot2
ggplot(mon_data_frame, aes(x = year, y = Government.surplus.or.deficit)) +
  geom_line(color = "blue", size = 1) + 
  labs(title = "Évolution du déficit public en France",
       x = "Année",
       y = "Déficit public (% du PIB)") +
  theme_minimal()

# Calcul de la matrice de corrélation pour plusieurs variables
cor_matrix <- cor(data[, c("Unemployment.Rate", "Household.saving.rate", "effective.exchange.rate", "NetTaxReceipts", "InflationRate", "GDP")])

# Visualisation de la matrice de corrélation avec corrplot
corrplot(cor_matrix, method = "color", 
         tl.col = "black", tl.srt = 45, 
         col = colorRampPalette(c("blue", "white", "red"))(200),
         addCoef.col = "black")

# Affichage de la matrice de corrélation sous forme de tableau
print(cor_matrix)

# Création du modèle de régression linéaire pour analyser le déficit public
model <- lm(Government.surplus.or.deficit ~ Unemployment.Rate + Household.saving.rate + effective.exchange.rate + NetTaxReceipts + GDP + InflationRate, data = data)

# Affichage des résultats du modèle
summary(model)

# Calcul des valeurs du VIF (Variance Inflation Factor) pour détecter la multicolinéarité
vif_values <- vif(model)
print(vif_values)

# Test de Breusch-Pagan pour l'hétéroscédasticité
bptest(model)

# Test de RESET pour la spécification du modèle
resettest(model)

# Diagnostic graphique du modèle (résidus vs ajustements)
plot(model, which = 1) # Graphique des résidus
plot(model, which = 2) # Graphique des résidus normalisés

# Test de normalité des résidus du modèle
shapiro.test(residuals(model))

# Test de Durbin-Watson pour détecter l'autocorrélation des erreurs
dwtest(model)
