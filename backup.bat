@echo off

REM Set the path to your MySQL bin folder in XAMPP
set MYSQL_BIN_PATH="D:\xampp8\mysql\bin"

REM Set the path to the backup folder
set BACKUP_FOLDER="D:\mysql_backup"

REM Set the MySQL username and password
set MYSQL_USER=root
set MYSQL_PASSWORD=

REM Set the list of databases to backup
set DATABASES=database_dashboard database_adminpanel database_exam database_attendance database_expenses call_management
@REM set DATABASES=database_attendance

REM Create the backup folder if it doesn't exist
if not exist %BACKUP_FOLDER% mkdir %BACKUP_FOLDER%

REM Loop through each database and export it
for %%i in (%DATABASES%) do (
    echo Backing up database: %%i
    %MYSQL_BIN_PATH%\mysqldump -u %MYSQL_USER%  --databases %%i > %BACKUP_FOLDER%\%%i_backup.sql

    REM Check if the backup was successful
    if %errorlevel% neq 0 (
        echo Error: Backup failed for database %%i
    ) else (
        echo Backup successful for database %%i
    )
)

@REM echo All databases backed up successfully.

pause
