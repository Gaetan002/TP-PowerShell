# Fonction vérifiant si le fichier de rapport est déjà créé et le supprime en conséquence
function Verif_fichier_rapport
{
	$VerifFichierRapport = Test-Path "$nomFichierRapport" # Vérifie si le fichier existe déjà et enregistre le résultat dans la variable "VerifFichierRapport"
	
	if ($VerifFichierRapport -eq "True") # Si le fichier existe
	{
		Remove-Item "$nomFichierRapport" # Supprime le fichier dans le cas où il existe déjà
	}
}

# Fonction permettant d'afficher les informations du CPU
function CPU
{
	$Infos_CPU = Get-WmiObject -Class Win32_Processor # Récupère les informations du CPU
	$fabricant = ($Infos_CPU).Manufacturer # Récupère le nom du fabricant du CPU dans la variable "fabricant"
	$modele = ($Infos_CPU).Name # Récupère le modèle du CPU dans la variable "modele"
	$socket = ($Infos_CPU).SocketDesignation # Récupère le nom du socket du CPU dans la variable "socket"
	
	# Affiche les informations récupérées concernant le CPU
	Write-Output "`nVoici des informations concernant le CPU :`n" # "`n" permet de revenir à la ligne
	Write-Output "Le fabricant du CPU est : $fabricant."
	Write-Output "Le modele du CPU est : $modele."
	Write-Output "Le socket du CPU est : $socket.`n"
}

# Fonction réalisant les mêmes étapes que pour la fonction "CPU"
function GPUetEcran
{
	$Infos_GPU = Get-WmiObject -Class Win32_VideoController # Récupère les informations du GPU
	$fabricant = ($Infos_GPU).AdapterCompatibility # Récupère le nom du fabricant du GPU dans la variable "fabricant"
	$modele = ($Infos_GPU).Name # Récupère le modèle du GPU dans la variable "modele"
	$definition = ($Infos_GPU).VideoModeDescription.Substring(0,11) # Récupère la définition de l'écran dans la variable "definition"
	$frequenceMax = ($Infos_GPU).MaxRefreshRate # Récupère la fréquence de rafraichissement maximum de l'écran dans la variable "frequenceMax"
	$frequenceMin = ($Infos_GPU).MinRefreshRate# Récupère la fréquence de rafraichissement minimum de l'écran dans la variable "frequenceMin"
	$frequenceActuelle = ($Infos_GPU).CurrentRefreshRate # Récupère la fréquence de rafraichissement actuelle de l'écran dans la variable "frequenceActuelle"
	$versionPilote = ($Infos_GPU).DriverVersion # Récupère la version du pilote graphique du GPU dans la variable "versionPilote"
	
	# Affiche les informations récupérées concernant le GPU et l'écran
	Write-Output "`nVoici des informations concernant le GPU et l'ecran :`n"
	Write-Output "Le fabricant du GPU est : $fabricant."
	Write-Output "Le modele du GPU est : $modele."
	Write-Output "La definition de l'ecran est de : $definition pixels."
	Write-Output "La frequence maximum de l'ecran est de : $frequenceMax Hz."
	Write-Output "La frequence minimum de l'ecran est de : $frequenceMin Hz."
	Write-Output "La frequence actuelle de l'ecran est de : $frequenceActuelle Hz."
	Write-Output "La version du pilote du GPU est la : $versionPilote.`n"
}

# Affiche des propositions selon ce qu'on souhaite afficher et enregistrer
Write-Host "`nCe script permet d'afficher ou de creer un rapport d'informations CPU, GPU et de l'ecran."
Write-Host "1 : Afficher ces informations CPU."
Write-Host "2 : Afficher et enregistrer des informations CPU dans un fichier."
Write-Host "3 : Afficher des informations GPU et de l'ecran."
Write-Host "4 : Afficher et enregistrer ces informations GPU et de l'ecran dans un fichier."
Write-Host "5 : Afficher et enregistrer toutes les informations dans un fichier.`n"

# Récupère la proposition choisie dans la variable "nomChoisi"
$numChoisi = Read-Host "Que souhaitez-vous ? (numero)"


if ($numChoisi -eq "1") # Si la proposition 1 est choisie
{
	CPU # La fonction CPU est appelée pour afficher les informations concernant le CPU
}
elseif ($numChoisi -eq "2") # Si la proposition 2 est choisie
{
	# Enregistre le nom du fichier qui va contenir les informations CPU dans la variable "nomFichierRapport" pour être correctement utilisée par la fonction "Verif_fichier_rapport"
	$nomFichierRapport = "Rapport_informations_CPU.txt"
	Verif_fichier_rapport # Appel de la fonction "Verif_fichier_rapport"
	
	# Création du fichier "Rapport_informations_CPU.txt"
	New-Item -ItemType File -Name "$nomFichierRapport" | Out-Null # "Out-Null" permet de ne pas afficher la sortie de la commande
	
	# Affiche les informations CPU tout en les enregistrant dans le fichier "Rapport_informations_CPU.txt"
	CPU | Tee-Object -FilePath "$nomFichierRapport" # "Tee-Object" permet d'afficher à la fois la sortie d'une commande et de l'enregistrer là où l'on souhaite, qui est dans ce cas le fichier "Rapport_informations_CPU.txt"
}
elseif ($numChoisi -eq "3") # Si la proposition 3 est choisie
{
	GPUetEcran # La fonction GPUetEcran est appelée pour afficher les informations concernant le GPU et l'écran
}
elseif ($numChoisi -eq "4") # Si la proposition 4 est choisie, les mêmes étapes que pour la propositions 2 sont suivies, mais en rapport avec le GPU et l'écran
{
	$nomFichierRapport = "Rapport_informations_GPUetEcran.txt"
	Verif_fichier_rapport
	New-Item -ItemType File -Name "$nomFichierRapport" | Out-Null
	
	GPUetEcran | Tee-Object -FilePath "$nomFichierRapport"
}
elseif ($numChoisi -eq "5") # Si la proposition 5 est choisie, même chose que pour les propositions 2 et 4, mais cette fois-ci ce sont à la fois les informations CPU, GPU et de l'écran qui sont enregistrées dans un fichier
{
	$nomFichierRapport = "Rapport_informationsCPU_GPUetEcran.txt"
	Verif_fichier_rapport
	New-Item -ItemType File -Name "$nomFichierRapport" | Out-Null
	
	CPU | Tee-Object -FilePath "$nomFichierRapport"
	GPUetEcran | Tee-Object -FilePath "$nomFichierRapport" -Append
	
}
else # Dans le cas où un mauvais numéro/caractère est entré, un message d'erreur s'affiche
{
	Write-Warning "Le numero ou caractere entre n'est pas correct."
}