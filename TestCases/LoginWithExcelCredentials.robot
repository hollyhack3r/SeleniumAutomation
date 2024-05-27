*** Settings ***
Library  SeleniumLibrary
Library  ExcelLibrary
Resource  ../Resources/Keywords.robot
Suite Setup  U_LaunchBrowser  ${URL}  ${Browser}
Suite Teardown  Close All Browsers

*** Variables ***
${Browser}  Chrome
${URL}  https://fwu.milessoft.com/FundwareUCITSClientQA_189/Authentication/Login.aspx
${EXCEL_FILE}  ../TestData/TestData.xlsx
${SheetName}  LoginCredentials

*** Test Cases ***
Login with Credentials from Excel
    ${RowCount}=  U_GetRowCountFromXLS  ${EXCEL_FILE}  ${SheetName}
    ${ColumnCount}=  U_GetColumnCountFromXLS  ${EXCEL_FILE}  ${SheetName}
    Log To Console  ${RowCount}
    Log To Console  ${ColumnCount}

    FOR  ${i}  IN RANGE  2  ${RowCount}+1
    ${RowData}=  Read Excel Row  row_num=${i}  col_offset=0  max_num=0  sheet_name=${SheetName}
    ${username}=  Set Variable  ${RowData}[0]
    ${password}=  Set Variable  ${RowData}[1]
    U_LoginApplication  ${username}  ${password}
    Log To Console  Logged in with username:${username} and password:${password}
    U_Verify Successful Login
    U_LogoutApplication
    Sleep  5
    END
