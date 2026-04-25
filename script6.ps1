# Récupération du nombre de ligne du fichier, correspondant au nombre de machine, dans la variable "nombre_machine"
$nombre_machines = (Get-Content .\machines.txt | Measure-Object -Line).Lines # le ".Lignes" récupère le contenu de la catégorie "Lignes" présente dans la réponse de la commande "Measure-Object -Line"

# Création du fichier du rapport des pings
Write-Output "Voici la liste des machines joignables ou non par un ping :" > Rapport_pings_machines.txt

Write-Host "Les tests de connectivite avec pings sont en cours, cela peu prendre un peu de temps."

# Boucle qui va tester la connectivité avec chaque machine et marquer le résultat dans le fichier
for ($i = 0; $i -lt $nombre_machines; $i++)
{
	$machine = (Get-Content -Path '.\machines.txt' -TotalCount $nombre_machines)[-($nombre_machines-$i)] # Récupération du nom de la machine pour chaque ligne du fichier
	$ResultatPing = Test-NetConnection -ComputerName $machine 3>$null # Envoi d'un ping à la machine n'affichant pas de message d'avertissement
	
	# Dans le cas où le ping réussi
	if ($ResultatPing.PingSucceeded) # Vérifie si le ping est un succès
	{
		Write-Output "$machine est joignable par un Ping." >> Rapport_pings_machines.txt # Enregistre un message de succès dans le fichier si le ping réussi
		
	}
	else # Dans le cas où le ping a échoué
	{
		Write-Output "$machine n'est pas joignable par un Ping." >> Rapport_pings_machines.txt # Enregistre un message d'échec dans le fichier si le ping échoue
	}
	
}

Write-Host "Les tests de connectivite sont termines."