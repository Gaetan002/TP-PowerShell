# Documentation des scripts

## Prérequis

Pour que nos scripts aient l’autorisation de s’exécuter, il faut aller dans les paramètres Windows (pour le cas de Windows 11 25H2), dans Système → Avancé, puis dans « Terminal », on déroule l’option « PowerShell » et on active l’option affichée :



Pour vérifier l’exécution, on va par exemple créer un dossier « Scripts PowerShell » dans « C:\ » (dossier qu’on va utiliser pour tous les scripts), puis créer un fichier « script de vérification.ps1 », où l’on va ajouter « Write-Host "Hello Word" » dans ce dernier, à l’aide de l’application Bloc-notes ou Notepad++ par exemple.
Maintenant, on lance l’application « Windows PowerShell » et on va aller lancer ce script en entrant « $ "<chemin du fichier" », ce qui donne ici :



On voit donc que le script est exécuté, et affiche bien « Hello Word » conformément à la commande « Write-Host "Hello Word" ».

## 1er script

Ce script, contenu dans le fichier « script1.ps1 » (toujours dans « C:\Scripts PowerShell »), contient les principales étapes de script suivantes :
    • créer un dossier « temp » (dans le répertoire actuel) ;
    • se déplacer dans le dossier « temp » créé ;
    • créer 200 fichiers vides nommés de 1.log à 200.log contenant la chaîne de caractères "Voici le fichier <numéro>.log", grâce à une boucle for;
    • revenir au répertoire initial, c’est-à-dire « C:\Scripts PowerShell ».

## 2e script

Ce script, contenu dans le fichier « script2.ps1 », contient les principales étapes de script suivantes :
    • demander à l’utilisateur de saisir le chemin d’un dossier ;
    • Vérifier si le chemin existe ;
        ◦ Si le chemin existe : supprimer tous les fichiers avec l’extension « .log » puis afficher un message de confirmation ;
        ◦ Si le chemin n’existe pas : afficher un message d’erreur pour signaler cela.

## 3e script

Ce script, contenu dans le fichier « script3.ps1 », contient les principales étapes de script suivantes :
    • demander un nombre entre 1 et 4 à l’utilisateur ;
        ◦ si le nombre choisi est 1 : demander le nom d’un fichier et le créer dans le répertoire actuel ;
        ◦ si le nombre choisi est 2 : demander le nom d’un dossier et le créer dans le répertoire actuel ;
        ◦ si le nombre choisi est 3 : demander le nom d’un fichier puis afficher son contenu ;
        ◦ si le nombre choisi est 4 : afficher la liste des éléments présents dans le répertoire actuel ;
        ◦ si le nombre choisi est 5 : sortir du script ;
        ◦ si une autre valeur est entrée : afficher un message d’avertissement.

## 4e script

Ce script, contenu dans le fichier « script4.ps1 », contient les principales étapes de script suivantes :
    • demander à l’utilisateur d’entrer deux nombres ;
    • calculer et afficher le résultat de la somme de ces deux nombres ;
    • calculer et afficher le résultat de la soustraction de ces deux nombres ;
    • calculer et afficher le résultat du produit de ces deux nombres ;
    • calculer et afficher le résultat de la division de ces deux nombres.
À savoir que pour chaque calcul, son résultat est enregistré dans un fichier texte faisant office d’historique des calculs.

## 5e script

Pour ce 5e script, le fichier « utilisateurs a creer.txt » doit contenir plusieurs utilisateurs, qui, pour chaque ligne, contient : « <nom d’un utilisateur>:<type de compte>; ».
Il y a deux types de compte : « adm » signifiant qu’il s’agit d’un compte avec des droits administrateurs et donc faisant partie du groupe Administrateurs, et « usr » signifiant qu’il s’agit d’un compte sans les droits administrateurs et donc faisant partie du groupe Utilisateurs.
Ce 5e script, contenu dans le fichier « script5.ps1 », contient les principales étapes de script suivantes :
    • récupération du fichier « utilisateurs a creer.txt » ;
    • création, sur le système Windows, de chaque utilisateur avec les droits cohérents à leur type défini dans le fichier ;
    • suppression, sur le système, des utilisateurs de la liste qui viennent d’être créés ;
À savoir que chaque action de création d’un utilisateur est enregistré dans un fichier texte faisant office d’historique de ces actions.
Pour effectuer tout cela, il y a d’abord deux fonctions, donc chacune récupère le jour et l’heure au moment de l’exécution du script pour l’historique des actions. Ensuite, une boucle for va récupérer chaque ligne du fichier « utilisateurs a creer.txt » comprenant les informations de chaque utilisateur, puis le créer et l’ajouter dans le bon groupe en fonction de s’il a les droits administrateurs ou non. En fonction de cela, il sera ajouté au bon groupe d’utilisateurs.
Ensuite, une autre boucle for va aussi lire les informations pour chaque utilisateur, mais juste garder le nom pour le supprimer.

## 6e script

Pour ce 6e script, fichier « machines.txt » doit contenir, sur chaque ligne, un nom différent de PC accessibles ou non à partir de notre machine.
Ce 6e script, contenu dans le fichier « script6.ps1 », contient les principales étapes de script suivantes :
    • récupération du fichier « machines.txt » ;
    • réalisation d’un ping pour chaque nom de machine présent dans le fichier.
À savoir que pour chaque machine à laquelle on a envoyé des pings, le résultat du ping est enregistré dans un fichier texte faisant office de rapport.
Pour cela, le script récupère le nombre de machines en récupérant le nombre de lignes présentes dans le fichier. Ensuite, le fichier texte de rapport est créé et le nom de chaque machine est récupéré pour le ping, tout en vérifiant le résultat du ping, dont ce résultat est enregistré dans le fichier, le tout grâce à une boucle for.

## 7e script

Ce script, contenu dans le fichier « script7.ps1 », contient les principales étapes de script suivantes :
    • proposer à l’utilisateur 5 choix, qui sont :
        ◦ 1 : afficher des informations CPU : le fabricant, le modèle et le socket du CPU sont affichés ;
        ◦ 2 : afficher et enregistrer les informations CPU : affiche et enregistre dans un fichier les informations CPU ;
        ◦ 3 : afficher des informations GPU et de l’écran : le fabricant GPU, le modèle GPU, la définition et fréquence (maximum, minimum et actuelle) de l’écran et la version du pilote graphique sont affichés ;
        ◦ 4 : afficher et enregistrer les informations GPU et de l’écran : affiche et enregistre dans un fichier les informations GPU et de l’écran ;
        ◦ 5 : afficher et enregistrer toutes les informations précédemment citées dans un fichier ;
        ◦ si une autre valeur est entrée : afficher un message d’avertissement.
Pour cela, une fonction Verif_fichier_rapport est appelée pour vérifier, pour chaque rapport qui devra être créé, si un même fichier existe, et dans le cas où il existe, il est supprimé avant de le recréer.
Ensuite, il y a la fonction CPU pour obtenir les informations CPU voulues ici et les afficher. Il y a une fonction du même type pour le GPU et l’écran.
Après, selon le numéro choisit, la fonction CPU et/ou GPUetEcran est simplement appelée pour afficher les informations nécessaires, ou si elles doivent être enregistrées, la vérification de l’existence du fichier avec la fonction Verif_fichier_rapport a lieu, puis le fichier de rapport est créé, et la sortie de ce qu’affiche la fonction CPU et/ou GPUetEcran est enregistrée dans le fichier.
