# Récupération du chemin du dossier grâce à l'entrée utilisateur pour le mettre dans la variable "chemin_dossier"
$chemin_dossier = Read-Host "Saisissez le chemin absolu d'un repertoire dont tous les fichiers avec l'extension '.log' seront supprimes"

# Mise en place de la commande dans la variable "Sortie_commande"
$Sortie_commande = Test-Path $chemin_dossier

# Récupération de la sortie de la commande dans la variable "verification"
$verification = "$sortie_commande"

# Vérification de l'existence du chemin du dossier

if ($verification -eq "True") # Vérifie que la commande ait bien "True" en sortie, signifiant l'existence du chemin du dossier
{ 
	Remove-Item -Path "$chemin_dossier\*.log" # Supprime tous les fichiers ayant l'extension ".log" dans le dossier renseigné
	Write-Host "Les fichiers en .log ont ete supprimes." # Affiche un message pour confirmer la suppression des fichiers en ".log"
}
else
{ 
	Write-Warning "Ce chemin n'existe pas." # Si le chemin reiseigné n'existe pas (sortie : False), affiche un message d'erreur
}
