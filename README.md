# Windows-backup-files
Backup selected files via powershell, vbs and scheduler.
The program was created in order to backup important files in a network folder connected as drive G every hour in the domain without administrative rights.


psBackup.ps1 - main Program. Can work independently of all the others.
silent_psBackup.vbs - a way to run powershell scripts without any popups. You can use your own method instead.
psHourlyBackup.xml - my exported template for the task scheduler. You can customize your period and frequency of reservations.
