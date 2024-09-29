------ database adminpanel 


REM Set the path to your MySQL bin folder in XAMPP
set MYSQL_BIN_PATH="D:\xampp8\mysql\bin"

REM Set MySQL username and password
set MYSQL_USER=root
set MYSQL_PASSWORD=

REM Set the database name
set DATABASE_NAME=feeapp_au

REM Set the database tables to be emptied or deleted
set TABLES_TO_EMPTY=accounts accounts_cash_in_hand account_groups account_transactions account_transaction_details additional_fee_structure allergies_abnormal_drugs_reaction ary_fee_collection ary_fee_exception  ary_misc_charges ary_misc_error ary_stationary_exception_charges audits bank_deposits cheque_details councelling current_health_issues dental_assesment education fee_collection fee_collection1 fee_structure_books_etc hearing_assesment hostel_master ipd_format  items2022 left_std_fee_col_details medical_examination medical_history_sheet medications misc_income new_adm_concession_leads occupations opd_format orders order_details otp_reprint_receipt permission_details physical_examination prospectus readmission rejoin_academics rejoin_account rejoin_account_clearance rejoin_barrier_details rejoin_hostel_details rejoin_last_year_pending rejoin_main_office rejoin_medical rejoin_step_status rejoin_vice_principal_approval reprint_log routes school_session_activities send_cancel_request siblings_delete_from_list sms_job_status sms_log stops `students1` `students2020-21` `students2021-22` `students2022-23` students_hostel_status students_hostel_status_history student_additional_charges student_credit_balance student_debit_balance student_feedback student_medical student_medical_records  student_refs student_siblings student_tc student_transfers student_transport student_transport_history tally_import tbl_date_log tbl_employees tbl_student_concession tbl_student_concession_remarks_bs tbl_user transport_charges transport_charges1 vaccination vehicles visitor visual_activity students `students2020-21` `students2021-22` `students2022-23` `students2023-24` student_parents student_university_data


REM Set the tables to keep data only for school_id=1
set TABLES_TO_KEEP=


REM Loop through tables and perform operations
for %%i in (%TABLES_TO_EMPTY%) do (
    echo Emptying table: %%i
    %MYSQL_BIN_PATH%\mysql -u %MYSQL_USER% -e "USE %DATABASE_NAME%;SET FOREIGN_KEY_CHECKS = 0; TRUNCATE TABLE %%i;SET FOREIGN_KEY_CHECKS = 1;"
)


for %%i in (%TABLES_TO_KEEP%) do (
    echo Keeping data for school_id=1 in table: %%i
    %MYSQL_BIN_PATH%\mysql -u %MYSQL_USER% -e "USE %DATABASE_NAME%; DELETE FROM %%i WHERE school_id <> 1;"
)


echo Database cleanup completed.

pause

