------ database adminpanel 

@REM empty -- sync_log
@REM delete --  students2021-22 , students2020-21,  students2019-20, stops1,fee_structure_2021

@REM keep data only for school_id=1 -- school_result_pre_post_mid_term,school_result_half_yearly_final,fee_collection,ary_fee_collection,tbl_student_concession
@REM ,orders,fee_structure,transport_fee_structure,	subject_teacher_mapping,	student_debit_balance


@REM -- database_dasboard 
@REM empty -- tbl_logs,audits,	tbl_bank_master,	tbl_arrears,tbl_emp_increment_brkup,	tbl_emp_audit_arrear,inspection_report_answers,	photo_gallery
@REM delete 

@REM keep data for school_id=1 -- 	tbl_emp_clerk_arrear,tbl_emp_leave,tbl_emp_clerk_salary,	tbl_emp_audit_salary,tbl_leave_req_form,issue_status_history,tbl_emp_docs

@echo off

REM Set the path to your MySQL bin folder in XAMPP
set MYSQL_BIN_PATH="D:\xampp8\mysql\bin"

REM Set MySQL username and password
set MYSQL_USER=root
set MYSQL_PASSWORD=

REM Set the database name
set DATABASE_NAME=database_attendance

REM Set the database tables to be emptied or deleted
set TABLES_TO_EMPTY=attendance_reg_11_2023 employees att_reg_10_2023 att_reg_9_2023 att_reg_8_2023 att_reg_7_2023 att_reg_6_2023 att_reg_5_2023 att_reg_4_2023 att_reg_3_2023 att_reg_2_2023 att_reg_1_2023 att_reg_12_2022 att_reg_11_2022 att_reg_10_2022 att_reg_9_2022 att_reg_8_2022 att_reg_7_2022 att_reg_6_2022 att_reg_5_2022 att_reg_4_2022 att_reg_3_2022 att_reg_2_2022 att_reg_1_2022

REM Set the tables to keep data only for school_id=1
set TABLES_TO_KEEP=attendance_upd_request

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

