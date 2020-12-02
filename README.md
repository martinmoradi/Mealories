🍴 Mealories 🍴

🍣 Présentation 🍣

Tu es passionné de bonne bouffe mais tu es en panne d'inspiration ? Tu aimerais gagner du temps et manger mieux ? Mealories est là pour toi ! Le concept est simple : on s'occupe de ton menu et en plus de ça, on fait attention à ce que tu vas manger ! En un clic, Mealories est capable de te générer une liste de recettes, pour X jours, dont les calories journalières correspondent à ton métabolisme.

Il suffit de nous renseigner tes habitudes et on s'occupe de tes plats, tu peux même enregistrer tes recettes préférées ! Mealories est capable d'analyser les recettes publiées sur le site français n°1 de cuisine : marmiton.org

Et pour te simplifier la vie, on t'envoie la liste des ingrédients par mail, pour que tu puisse aller faire tes courses sereinement !

🍪 Parcours utilisateur 🍪

En arrivant sur le site, tu découvriras page d'accueil avec un grand hero header pour mettre en avant le call to action. En dessous, quelques recettes donnant envie. Tu seras amené à t'inscrire afin de renseigner les informations nécessaires au calcul de ton budget calorique.
Une fois inscrit, l’application te proposera de créer un menu avec un nombre de repas choisi.

🍜 Concrètement, comment ça tourne ? 🍜

🍫 Base de donnée 🍫
La base de donnée relationnelle sera en PostgreSQL. Les principaux Usual Suspects des tables et modèles seront bien présents :

users
recipes
menus
Et sans doute bien d'autres, à ce stade du projet, nous n'avons pas défini encore précisément à quoi ressemblera notre BDD.

🍩 Front 🍩

Nous comptons utiliser le framework TailwindCSS qui permet une approche utilitariste, en nous laissant la possibilité de créer nos propres components, en native CSS. L’UI / UX sera soignée avec un layout moderne et responsive. On a déjà identifié la plupart des views à développer. De manière non exhaustive, on sait déjà qu'il nous faudra de belles pages recipes, users et menus.

🍭 Back-end 🍭

Afin de calculer les informations nutritionnelles des recettes, nous avons besoin d’une API externe dont le choix est toujours en cours, sous réserve de tests (pour le moment notre choix est Nutritionix). Il s'agira d'extraire les ingrédients des recettes et d'envoyer les informations à l'API, qui nous retournera la valeur calorique par ingrédient. De ce qu'on en a vu, pas mal de JSON à prévoir 😀.

Nous avons testé avec succès la gem Recipe_Scrapper, qui fonctionne sur le site de Marmiton et qui nous permet d'extraire des recettes de leur site pour peupler notre BDD. En version finale, l'utilisateur pourra lui aussi importer ses recettes.

Devise fera également partie de la stack, permettant de simplifier la gestion des utilisateurs.

Enfin, il y aura un mailer pour les interactions avec l’utilisateur (inscription, renouvellement de mot de passe …) et l’envoi en version finale de la liste des ingrédients une fois le menu validé.

🍗 MVP 🍗

La version minimale du produit comprendra un système d’inscription / authentification et une base de données déjà bien garnie en recettes pour que les nouveaux utilisateurs puissent générer leurs menus sans avoir besoin d’importer leurs recettes. La plupart des views devront être en ligne.

🍦 Version finale 🍦

La version finale comprendra certaines features en plus :

L’utilisateur peut importer des recettes
Historique utilisateur des menus
Système de favoris
Partage ton menu ! :
Mailer pour envoi de listes d’ingrédients
Potentiellement (si on a le temps 😀) affinage de l’algo de génération de menu en ajoutant des options à l'utilisateur : régime alimentaire, allergies...
🍺 Notre mentor 🍺
MONTAIGUT Luca s'est proposé d'être le mentor de notre projet ! Merci <3
