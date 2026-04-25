# Fonction récupérant le jour actuel
function Jour
{
	(Get-Date).ToString("dd/MM/yyyy") # Récupère la date et ne garde que le jour actuel
}

# Fonction récupérant l'heure actuelle
function Heure
{
	(Get-Date).ToString("HH:mm:ss") # Récupère la date et ne garde que l'heure actuelle
}

# Récupération du nombre de ligne du fichier contenant les utilisateurs, correspondant au nombre d'utilisateurs, dans la variable "nombre_utilisateur"
$nombre_utilisateur = (Get-Content '.\utilisateurs a creer.txt' | Measure-Object -Line).Lines

# Création du fichier qui contiendra l'historique de création des utilisateurs
Write-Output "Voici l'historique de creation des utilisateurs :" > Historique_creation_comptes.txt

# Boucle qui va créer chaque utilisateur du fichier
for ($i = 0; $i -le $nombre_utilisateur; $i++)
{
	# Récupération des informations de l'utilisateur
	$utilisateur = (Get-Content -Path '.\utilisateurs a creer.txt' -TotalCount $nombre_utilisateur)[-($nombre_machines-$i)]
	
	# Récupération du nom de l'utilisateur puis du type d'utilisateur
	$nom_utilisateur = $utilisateur.Substring(0,$utilisateur.IndexOf(":")) # Récupération du nom de l'utilisateur en retenant les caractères de l'index n°0 compris à l'index du ":" (exclu)
	$type_utilisateur = $utilisateur.Substring($utilisateur.IndexOf(":")+1,3) # Récupération du type d'utilisateur en retenant les caractères de l'index n°0 compris à l'index du ":" (exclu)
	
	# Création de l'utilisateur en fonction de son type
	if ($type_utilisateur -eq "adm") # Vérification de si l'utilisateur doit être administrateur
	{
		New-LocalUser -Name "$nom_utilisateur" -NoPassword # Création de l'utilisateur sans mot de passe
		Add-LocalGroupMember -Group "Administrateurs" -Member "$nom_utilisateur" # Attribution de l'utilisateur au groupe des administrateurs
		$jour = Jour # Appelle la fonction Jour et met le jour actuel dans la variable "jour"
		$heure = Heure # Appelle la fonction Heure et met l'heure actuelle dans la variable "heure"
		Write-Output "Le compte administrateur '$nom_utilisateur' a ete cree le $jour a $heure." > Historique_creation_comptes.txt # Enregistre la date et l'heure de création de l'utilisateur dans un fichier
	}
	else # Si l'utilisateur doit être un utilisateur classique
	{
		New-LocalUser -Name "$nom_utilisateur" -NoPassword # Création de l'utilisateur sans mot de passe
		Add-LocalGroupMember -Group "Utilisateurs" -Member "$nom_utilisateur" # Attribution de l'utilisateur au groupe des utilisateurs sans droits administrateur
		$jour = Jour
		$heure = Heure
		Write-Output "Le compte utilisateur '$nom_utilisateur' a ete cree le $jour a $heure." >> Historique_creation_comptes.txt
	}
}

Write-Host "Petite pause dans le script pour vous laisser verifier que les utilisateurs ont bien ete crees, avant de les supprimer."
Pause

# Boucle qui va supprimer chaque utilisateur du fichier
for ($i = 0; $i -lt $nombre_utilisateur; $i++)
{
	# Récupération des informations de l'utilisateur
	$utilisateur = (Get-Content -Path '.\utilisateurs a creer.txt' -TotalCount $nombre_utilisateur)[-($nombre_machines-$i)]
	
	# Récupération du nom de l'utilisateur
	$nom_utilisateur = $utilisateur.Substring(0,$utilisateur.IndexOf(":"))
	
	# Suppression de l'utilisateur
	Remove-LocalUser -Name "$nom_utilisateur"
}

Write-Host "Le script est termine, vous pouvez verifier que les utilisateurs ont bien ete supprimes."
Pause
break