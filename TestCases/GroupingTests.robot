*** settings ***
Library SeleniumLibrary

*** test cases ***
TC01 Edit and save master
    [Tags]  Sanity Test
    Log To Console  Edit and save the master
    Log To Console  This is sanity test

TC02 Create Rule
    [Tags]  Regression Test
    Log To Console  Create a rule
    Log To Console  This is regression test

TC03 Upload Files and complete ICM dashboard
    [Tags]  Sanity Test
    Log To Console  Upload files and complete ICM dashboard
    Log To Console  This is sanity test

TC04 Create CDA and check its value in Holding Report
    [Tags]  Regression Test
    Log To Console  Create a CDA
    Log To Console  This is regression test