FR:

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



EN: 

To make the script work, you need to modify a few parameters in the .ps1 file and the source.txt file.

In the CONFIGURATION section, you must:

Specify the path to the "Source.txt" file

Specify the path to the directory where you want to save the documents

Specify the path to the logs folder

As for the "source.txt" file:

In this file, you need to list the paths of the folders/files you want to back up

To automate the script using the Windows Task Scheduler:

✅ 1. Open Task Scheduler

Press Win + R, type taskschd.msc, and press Enter

Click "Create Task" in the right panel (not "Create Basic Task" to access more options)

✅ 2. General Tab

Name: Automatic Backup

Check "Run with highest privileges" ✔️ (very important for PowerShell scripts)

Optional: Select "Run whether user is logged on or not" if you want it to run in the background

✅ 3. Triggers Tab

Click "New…" to add a trigger

Begin the task: "On a schedule"

Choose daily, weekly, or another frequency

Set the desired time (e.g., 8:00 PM)

✅ 4. Actions Tab

Click "New…", then:

Action: "Start a program"

Program/script: powershell.exe

Add arguments:

arduino
Copier
Modifier
-ExecutionPolicy Bypass -File "path_to_your_script"
(Using ExecutionPolicy Bypass allows the script to run even if PowerShell's execution policy is restrictive.)

✅ 5. Conditions and Settings Tabs

You can uncheck:
"Start the task only if the computer is on AC power" ⚡

And check:
"Run task as soon as possible after a scheduled start is missed"

