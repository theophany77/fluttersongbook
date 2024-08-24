# fluttersongbook
fluttersongbook

Voici le premier jet d'un carnet de chants chrétiens devéloppé sous Flutter.
La précédente mouture était écrit en java natif sous Android Studio.

Le fichier json des chants est chargé dès le départ.
Il est pour l'instant figé dans le dossier des assets mais devrait à terme être 
récupérable sur une URL pour en faciliter la maintenance.

A ce stade, le main affiche deux boutons qui permettent :
- soit d'appeler la liste des chants
- soit d'afficher une page de recherche

La page "liste des chants" permet ensuite d'obtenir le détail d'un chant.
La page "Recherche" permet de rechercher un ou plusieurs critères au sein de la base de chants
et d'afficher ensuite le ou les chants candidats.

