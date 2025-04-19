Pour que le script fonctionne il faut changer quelque paramètre du fichier .ps1 et du fichier source.txt.

Dans la section CONFIGURATION, il faut : 

   - Indiquer le chemin du fichier "Source.txt"
   - Indiquer le chemin du répertoire souhaité pour enregistrer les documents
   - Indiquer le chemin du dossier logs 

-----------------------------------------------------------------------------------------------------------------------------

Pour ce qui est du fichier "source.txt" :

    Dans ce fichier il faut indiquer les chemins des dossier/fichier que tu souhaites sauvegarder 

-----------------------------------------------------------------------------------------------------------------------------

Pour automatiser le script à l'aide du planificateur de tâche de Windows : 

    ✅ 1. Ouvrir le Planificateur de tâches
        - Appuie sur Win + R, tape taskschd.msc et appuie sur Entrée.
        - Clique sur "Créer une tâche" dans le volet droit (et pas "Créer une tâche de base", pour plus d’options).

    ✅ 2. Onglet Général
        - Nom : Sauvegarde automatique
        - Exécuter avec les autorisations les plus élevées ✔️ (très important pour les scripts PowerShell)
        - Optionnel : choisis "Exécuter si l'utilisateur est connecté ou non" si tu veux qu'elle tourne en arrière-plan.

    ✅ 3. Onglet Déclencheurs
        - Clique sur "Nouveau…" pour ajouter un déclencheur :
        - Début de la tâche : "Selon un calendrier"
        - Choisis quotidien, hebdomadaire, ou autre
        - Choisis l’heure souhaitée (ex. : 20:00)

    ✅ 5. Onglet Actions
        - Clique sur "Nouveau…" puis :
        - Action : "Démarrer un programme"
            Programme/script : powershell.exe

        - Ajouter des arguments : -ExecutionPolicy Bypass -File "chemin du script" 
        (ExecutionPolicy Bypass permet d'exécuter ton script même si ta politique PowerShell est restrictive.)

    ✅ 6. Onglets Conditions et Paramètres
        - Tu peux décocher :
            Démarrer la tâche uniquement si l’ordinateur est en courant alternatif" ⚡
             Et cocher "Exécuter la tâche dès que possible après un démarrage planifié manqué"