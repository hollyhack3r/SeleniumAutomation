*** settings ***
Library  SeleniumLibrary
Resource  ./Resources/Keywords.robot
Suite Setup  U_LaunchBrowser
SUite Teardown  Close All Browsers


*** variables ***
${maker_username}  sa
${maker_password}  Oregon@2018
${checker_username}  vinit
${checker_password}  Oregon@2018
${MasterPageTitle}  MoneyWare FundWare - Company Master
${ApprovalPageTitle}  MoneyWare FundWare - Companies Approval
${company_name}  TestCompany

*** test cases ***
CreateAndApproveCompanyMaster
    U_LoginToApplication  ${maker_username}  ${maker_password}
    U_Dashboard Should Be Visible
    U_NavigateToApplication  Reference Data  Entities  Companies

    #Verify Page Title
    Title Should Be  ${MasterPageTitle}

    #Click on Create Button
    Click Image  id:ibtnNew

    Set Selenium Timeout  10 seconds
    Wait Until Page Contains  Create New Company

    Set Selenium Implicit Wait  10 seconds
    #Enter Company Name
    Input Text  name:ctl00$cphPageContent$tbCompanyName  TestCompany

    #Enter Company Code
    Input Text  name:ctl00$cphPageContent$tbCompanyShortName  TestCompany

    #Select Issued Capital CCY
    Select From List By Label  name:ctl00$cphPageContent$ddlIssuedCapitalCurrency  USD

    #Selct Debt in Issue CCY
    Select From List By Label  name:ctl00$cphPageContent$ddlIssuedDebtSharesCurrency  USD

    #Select Debt in Issue - Nominal CCY
    Select From List By Label  name:ctl00$cphPageContent$ddlIssuedDebtNominalValueCurrency  USD

    #Select Debt in Issue - Duration Adjusted CCY
    Select From List By Label  name:ctl00$cphPageContent$ddlIssuedDebtDurationAdjustedValueCurrency  USD

    #Select Acceptable Deposit Taker / Counter Party as Yes
    Click Element  xpath://label[@for="cphPageContent_rbDepositTaker"]

    #Select GOPS as Yes
    Click Element  xpath://label[@for="cphPageContent_rbIsGAPS"]

    #Select Type
    Select From List By Label  name:ctl00$cphPageContent$ddlCompanyType  Company

    #Verify if All Entity Type are checked
    Checkbox Should Be Selected  id:cphPageContent_cblCompanyUsedFor_0
    Checkbox Should Be Selected  id:cphPageContent_cblCompanyUsedFor_1
    Checkbox Should Be Selected  id:cphPageContent_cblCompanyUsedFor_2

    #Enter Issued Capital
    Input Text  name:ctl00$cphPageContent$tbCompanyCapital  1000

    #Enter Debt in Issue
    Input Text  name:ctl00$cphPageContent$tbIssuedDebtShares  1000

    #Enter Debt in Issue - Nominal
    Input Text  name:ctl00$cphPageContent$tbIssuedDebtNominalValue  1000

    #Enter Debt in Issue - Duration Adjusted
    Input Text  name:ctl00$cphPageContent$txtIssuedDebtDurationAdjustedValue  1000

    #Enter Paid Up Capital %
    Input Text  name:ctl00$cphPageContent$tbCompanyPaidCapitalPercent  50

    #Select Acceptable OTC Limit
    Select From List By Label  name:ctl00$cphPageContent$ddlAcceptableOTCLimit  10%

    #Enter Start Date
    Input Text  name:ctl00$cphPageContent$dtSponsorStartDate$tbDateText  01/01/2010

    #Enter End Date
    Input Text  name:ctl00$cphPageContent$dtSponsorEndDate$tbDateText  01/01/2050

    #Save Master
    Click Image  id:ibtnSave

    Set Selenium Timeout  20 seconds
    Wait Until Page Contains  Data was saved successfully and sent for approval

    U_LogoutApplication

    U_LoginToApplication  ${checker_username}  ${checker_password}

    U_NavigateToApplication  Approvals  Entities & Asset Types  Companies

    #Verify Page Title
    Title Should Be  ${Approval_Title}

    #Edit Pending approval company master
    Click Link  xpath:(//td[normalize-space()="${company_name}"])[1]/parent::tr/td[7]/a

    #Click on Approve button
    Click Image  id:cphPageContent_btnApprove

    Handle Alert

    Set Selenium Timeout  20 seconds
    Wait Until Page Contains  Request approved successfully.

    U_LogoutApplcation


