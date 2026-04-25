# Récupération d'un nombre grâce à l'entrée utilisateur pour le mettre dans la variable "nombre"
$nombre = Read-Host "Choisissez un nombre entre 1 et 4"

if ($nombre -eq 1) # Vérifie si le nombre est "1"
{
	$fichier = Read-Host "Maintenant, entrez le nom d'un fichier a creer dans le repertoire actuel" # Récupère le nom du fichier grâce à l'entrée utilisateur pour le mettre dans la variable "fichier"
	New-Item -ItemType File -Name "$fichier" # Crée le fichier dans le répertoire courant avec le nom récupéré
}

elseif ($nombre -eq 2) # Vérifie si le nombre est "2" dans le cas où la condition précédente n'est pas vérifiée
{
	$dossier = Read-Host "Maintenant, entrez le nom d'un dossier a creer" # Récupère le nom du dossier grâce à l'entrée utilisateur pour le mettre dans la variable "dossier"
	New-Item -ItemType Directory -Name "$dossier" # Crée le dossier avec le nom récupéré
}

elseif ($nombre -eq 3) # Vérifie si le nombre est "3" dans le cas où la condition précédente n'est pas vérifiée
{
	$fichier = Read-Host "Maintenant, entrez le nom d'un fichier pour afficher son contenu" # Récupère le nom du fichier grâce à l'entrée utilisateur pour le mettre dans la variable "fichier"
	Write-Host "Voici le contenu du fichier :"
	Get-Content -Path "$fichier" # Affiche le contenu du fichier renseigné
}

elseif ($nombre -eq 4) # Vérifie si le nombre est "4" dans le cas où la condition précédente n'est pas vérifiée
{
	Write-Host "Voici la liste des elements presents dans le repertoire actuel :"
	Get-ChildItem
}

elseif ($nombre -eq 5)
{
	Write-Host "Sortie du script."
	break
}

else
{
	Write-Warning "La valeur entree n'est pas conforme." # Pour tout autre valeur entrée, un message d'avertissement s'affiche
}
