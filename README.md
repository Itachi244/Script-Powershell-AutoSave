# Script-Powershell-AutoSave
Script powershell to automatically back up some folders or files with logs


🛡️ Automatic Backup Project with Logging

🎯 Objective
The goal of this project is to set up an automatic backup system for important files, with the creation of a log file that tracks the backup operations in detail.

🧱 Context
In a professional environment, it is crucial to regularly secure critical data (office documents, Excel files, PDFs, local databases, etc.). This project addresses that need by automating the daily backup of such files to a secure location (USB drive, external disk, network folder, etc.).

⚙️ Main Features
✅ Backup Configuration
The user can define:

The folders or files to back up via a configuration file : source.txt

The destination folder

✅ Backup Execution
If a file or folder already exists in the destination, a strategy is applied (replacement)

✅ Logging
Automatic generation of a log file for each backup :

Start time
List of copied files
Any errors
Logs are stored in the logs/ directory

✅ Automation
The script can be run automatically every day at a specific time using the Windows Task Scheduler

🧠 Technical Constraints : 
🖥️ Platform: Windows (PowerShell)
📂 No graphical interface (everything is done via scripts and config files)
🔧 Usable by other users thanks to a simple configuration file and a clear structure
