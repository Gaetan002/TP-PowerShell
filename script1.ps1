# Création du fichier "temp"
New-Item -ItemType Directory -Name "temp" | Out-Null

# Déplacement dans le dossier "temp" nouvellement créé
Push-Location temp

# Boucle qui va créer les 200 fichiers vide nommés de 1.log à 200.log contenant le texte "Voici le fichier <numéro>.log"
for ($numFichier = 1; $numFichier -le 200; $numFichier++)
{
	New-Item -ItemType File -Name "$numFichier.log" # Création du fichier vide avec le bon numéro
	"Voici le fichier $numFichier.log" >> "$numFichier.log" # Ajout du texte dans le fichier
}

# Revient dans le répertoire initial où se trouve le fichier script1.ps1
Pop-Location