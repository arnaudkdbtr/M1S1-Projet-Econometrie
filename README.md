![R Version](https://img.shields.io/badge/R-4.0%2B-blue)
![Data Source](https://img.shields.io/badge/Source-Eurostat-brightgreen)
![Country](https://img.shields.io/badge/Pays-France-red)
![Method](https://img.shields.io/badge/M%C3%A9thode-R%C3%A9gression%20Lin%C3%A9aire-orange)
![Focus](https://img.shields.io/badge/Focus-D%C3%A9ficit%20Public-blueviolet)

# Analyse des Déterminants Macroéconomiques du Déficit Public en France

## 📌 Présentation du Projet

Ce projet vise à analyser les principaux déterminants macroéconomiques influençant le déficit public en France au cours des 20 dernières années. En utilisant des données issues d’**Eurostat**, nous explorons l’impact de variables économiques telles que le taux de chômage, le taux d’épargne des ménages, le taux d’inflation, le taux de change effectif, les recettes fiscales nettes et le PIB sur l’évolution du déficit public.

L’objectif est d’apporter des éléments d’analyse pouvant éclairer les décisions de politique économique en matière de gestion budgétaire.

## 📊 Jeu de Données

Les données utilisées proviennent de **Eurostat** et couvrent la période **2003-2023**.  
### Principales variables :
- `Government.surplus.or.deficit` : Déficit/excédent public (% du PIB)
- `NetTaxReceipts` : Recettes fiscales nettes (% du PIB)
- `Unemployment.Rate` : Taux de chômage (en %)
- `Household.saving.rate` : Taux d’épargne des ménages (en %)
- `InflationRate` : Taux d’inflation (IPC, en %)
- `effective.exchange.rate` : Taux de change effectif des pays industrialisés
- `GDP` : Croissance du PIB (en %)

## 🏗 Méthodologie

Nous utilisons un **modèle de régression linéaire multiple** pour estimer l’influence des différentes variables sur le déficit public.

### Spécification du modèle :

Government.surplus.or.deficit = β₀ + β₁ Unemployment.Rate + β₂ Household.saving.rate + β₃ effective.exchange.rate + β₄ NetTaxReceipts + β₅ GDP + β₆ InflationRate + u_t

### Principaux Résultats :
- **Le taux de chômage et le taux d’épargne des ménages ont un impact négatif et significatif** sur le déficit public.
- **Les recettes fiscales nettes et le taux de change effectif réduisent le déficit**, indiquant leur importance dans l’équilibre budgétaire.
- **Le PIB a un effet positif modéré**, tandis que l’inflation n’a pas d’effet significatif sur le déficit public.

### Choix du Modèle :
- **Test de multicolinéarité (VIF)** : Pas de problème majeur détecté.
- **Test de Breusch-Pagan** : Pas d’hétéroscédasticité significative.
- **Test RESET de Ramsey** : Pas de problème de spécification du modèle.
- **Test de Durbin-Watson** : Pas d’autocorrélation des résidus.
- **Test de Shapiro-Wilk** : Normalité des résidus validée.

## ⚙️ Implémentation

L’analyse est réalisée sous **R**, en utilisant les packages suivants :
- `ggplot2` (visualisation des tendances)
- `lmtest` (tests statistiques)
- `car` (analyse de la multicolinéarité)
- `stargazer` (génération de tableaux)

## 📂 Accédez aux fichiers

- [Dossier PDF final du projet](Dossier-PDF-Markdown.pdf)  
  Ce lien vous redirigera vers le document PDF détaillant les résultats finaux du projet.
  
- [Code R utilisé dans l’analyse](R-Code)  
  Vous pouvez explorer le code source du projet dans ce dossier pour plus de détails sur l'implémentation.

## Auteurs

- ZELLER Emile
- HOBBALLAH Rayan
- Arnaud KINDBEITER
