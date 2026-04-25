# Ajout d'un premier nombre grâce à l'entrée utilisateur qu'on ajoute dans la variable "nombre1"
[int]$nombre1 = Read-Host "Entrez un premier nombre" # Ajouter "[int]" devant le nom de la variable permet de spécifier qu'il s'ajit d'un nombre et non une chaîne de caractère, permettant de correctement effectuer les calculs par la suite

# Ajout d'un second nombre grâce à l'entrée utilisateur qu'on ajoute dans la variable "nombre2"
[int]$nombre2 = Read-Host "Entrez un second nombre"

# Création du fichier "Calculs du script 4.txt" qui va contenir l'historique des calculs et dont on spécifie directement les nombres choisis
Write-Output "Les deux nombres choisis sont $nombre1 et $nombre2." > "Calculs du script 4.txt"



# Calcul de la somme des nombres choisis, qu'on met dans la variable "resultat_somme"
$resultat_somme = $nombre1 + $nombre2

# Affiche le résultat de la somme à l'utilisateur

Write-Host "La somme des deux nombres fait : $resultat_somme"

# Écriture le résultat de la somme dans le fichier
Write-Output "La somme des deux nombres fait : $resultat_somme" >> "Calculs du script 4.txt"



# Calcul de la soustraction des nombres choisis, qu'on met dans la variable "resultat_soustration"
$resultat_soustration = $nombre1 - $nombre2

# Affiche le résultat de la soustraction à l'utilisateur

Write-Host "La soustraction des deux nombres fait : $resultat_soustration"

# Écriture le résultat de la soustraction dans le fichier
Write-Output "La soustraction des deux nombres fait : $resultat_soustration" >> "Calculs du script 4.txt"



# Calcul du produit des nombres choisis, qu'on met dans la variable "resultat_produit"
$resultat_produit = $nombre1 * $nombre2

# Affiche le résultat du produit à l'utilisateur

Write-Host "Le produit des deux nombres fait : $resultat_produit"

# Écriture le résultat du produit dans le fichier
Write-Output "Le produit des deux nombres fait : $resultat_produit" >> "Calculs du script 4.txt"



# Calcul de la division des nombres choisis, qu'on met dans la variable "resultat_division"
$resultat_division = $nombre1 / $nombre2

# Affiche le résultat de la division à l'utilisateur

Write-Host "La division des deux nombres fait : $resultat_division"

# Écriture le résultat de la division dans le fichier
Write-Output "La division des deux nombres fait : $resultat_division" >> "Calculs du script 4.txt"
