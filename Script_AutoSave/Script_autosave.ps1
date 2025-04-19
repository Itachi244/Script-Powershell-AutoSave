#Configuration
$SourceListe = #Chemins du fichier "source.txt".#
$Destination = #Chemin du répertoire de destination.#
$LogFolder = #Dossier logs du dossier Script_Autosave"#
$LogFile = "$LogFolder\sauvegarde_$(Get-Date -Format 'dd-mm-yyyy_HH-mm-ss').log"

# Fonction de journalisation
function Write-Log {
    param ([string]$message)
    $timestamp = Get-Date -Format "dd-mm-yyyy HH:mm:ss"
    $entry = "$timestamp - $message"
    Add-Content -Path $LogFile -Value $entry
}
# Vérifier l'existence du fichier source.txt
if (!(Test-Path $SourceListe)) {
    Write-Log "Erreur : Le fichier source.txt est introuvable à l’emplacement : $SourceListe"
    throw "Fichier source introuvable, script arrêté."
}

# Vérifier si le dossier de destination existe
if (!(Test-Path -Path $Destination)) {
    Write-Log "Erreur : Le dossier de destination est introuvable : $Destination"
    throw "Destination introuvable, script arrêté."
}

# Vérifier l'existence du dossier de destination
if (!(Test-Path $Destination)) {
    Write-Log "Erreur : Le dossier de destination est introuvable : $Destination"
    throw "Destination introuvable, script arrêté."
}

# Vérifier l'existence du dossier de logs
if (!(Test-Path $LogFolder)) {
    Write-Log "Erreur : Le dossier de logs est introuvable : $LogFolder"
    throw "Dossier de logs introuvable, script arrêté."
}


#Début du log 
Write-Log "Début de la sauvegarde"

## Initialisation des compteurs
[int]$nbFichiers = 0
[int]$nbDossiers = 0
[int]$nbErreurs = 0

# Lire chaque chemin dans source.txt et les sauvegarder
Get-Content $SourceListe | ForEach-Object {
    $Chemin = $_.Trim()
    
    if (Test-Path $Chemin) {
        $Nom = Split-Path -Path $Chemin -Leaf
        $DestinationFinale = Join-Path $Destination $Nom
        
        try {
            if (Test-Path $Chemin -PathType Container) {
                if (Test-Path $DestinationFinale) {
                    Write-Log "Dossier existant trouvé à la destination : $DestinationFinale - Il sera remplacé."
                    Remove-Item -Path $DestinationFinale -Recurse -Force
                }
                Copy-Item -Path $Chemin -Destination $DestinationFinale -Recurse -Force -ErrorAction Stop
                Write-Log "Dossier sauvegardé : $Chemin -> $DestinationFinale"
                $nbDossiers++
            }
            else {
                if (Test-Path $DestinationFinale) {
                    Write-Log "Fichier existant trouvé à la destination : $DestinationFinale - Il sera remplacé."
                }
                Copy-Item -Path $Chemin -Destination $DestinationFinale -Force -ErrorAction Stop
                Write-Log "Fichier sauvegardé : $Chemin -> $DestinationFinale"
                $nbFichiers++
            }
        }
        catch {
            Write-Log "Erreur lors de la sauvegarde de $Chemin : $_"
            $nbErreurs++
        }
    }
    else {
        Write-Log "Chemin introuvable ou invalide : $Chemin"
        $nbErreurs++
    }
}

# Résumé
Write-Log "Résumé de la sauvegarde :"
Write-Log " - Fichiers sauvegardés : $nbFichiers"
Write-Log " - Dossiers sauvegardés : $nbDossiers"
Write-Log " - Éléments ignorés / erreurs : $nbErreurs"

# Fin du log
Write-Log "Fin de la sauvegarde"