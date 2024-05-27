*** settings ***
Library  SeleniumLibrary
Variables  ../PageObjects/Locators.py


*** keywords ***
U_LaunchBrowser
    [Arguments]  ${Application_URL}  ${Browser}
    Open Browser  ${Application_URL}  ${Browser}
    Maximize Browser Window

U_LoginApplication
    [Arguments]  ${username}  ${password}
    Input Text  ${Login_Username}  ${username}
    Input Text  ${Login_Password}  ${password}
    Click Button  ${Login_Button}

U_Verify Successful Login
    Element Should Be Visible  ${PageTitle}

U_NavigateToApplication
    [Arguments]  ${Menu}  ${SubMenu}  ${SubItem}
    Click Element  ${Menu}
    Click Element  ${SubMenu}
    Click Element  ${SubItem}

U_LogoutApplication
    Click Element  ${WelcomeUser}
    Click Link  ${Logout}
    Handle Alert

U_GetRowCountFromXLS
    [Arguments]  ${EXCEL_FILE}  ${SheetName}
    Open Excel Document  filename=${EXCEL_FILE}  doc_id=1
    ${col_data}=  Read Excel Column  col_num=1  sheet_name=${SheetName}
    ${row_count}=  evaluate  len(${col_data})
    RETURN  ${row_count}
    Close All Excel Documents

U_GetColumnCountFromXLS
    [Arguments]  ${EXCEL_FILE}  ${SheetName}
    Open Excel Document  filename=${EXCEL_FILE}  doc_id=2
    ${row_data}=  Read Excel Row  row_num=1  sheet_name=${SheetName}
    ${col_count}=  evaluate  len(${row_data})
    RETURN  ${col_count}
    Close All Excel Documents
