@echo off

REM Set the path to your MySQL bin folder in XAMPP
set MYSQL_BIN_PATH="D:\xampp8\mysql\bin"

REM Set MySQL username and password
set MYSQL_USER=root
set MYSQL_PASSWORD=

REM Set the database name
set DATABASE_NAME=database_dashboard

REM Set the database tables to be emptied or deleted
set TABLES_TO_EMPTY=tbl_logs audits tbl_bank_master tbl_arrears tbl_emp_increment_brkup tbl_emp_audit_arrear inspection_report_answers photo_gallery tbl_emp_leave issue_status_history tbl_emp_docs

REM Set the tables to keep data only for school_id=1
set TABLES_TO_KEEP=tbl_emp_clerk_arrear tbl_emp_clerk_salary tbl_emp_audit_salary tbl_leave_req_form  

REM Loop through tables and perform operations
for %%i in (%TABLES_TO_EMPTY%) do (
    echo Emptying table: %%i
    %MYSQL_BIN_PATH%\mysql -u %MYSQL_USER% -e "USE %DATABASE_NAME%; DELETE FROM %%i;"
)


for %%i in (%TABLES_TO_KEEP%) do (
    echo Keeping data for school_id=1 in table: %%i
    %MYSQL_BIN_PATH%\mysql -u %MYSQL_USER%  -e "USE %DATABASE_NAME%; DELETE FROM %%i WHERE school_id <> 1;"
)

echo Database cleanup completed.

pause

