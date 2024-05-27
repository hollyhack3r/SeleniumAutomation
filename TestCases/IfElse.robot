*** variables ***
${a}  3
${b}  5
*** test cases ***
IF ELSE Test
    Run Keyword If  ${a}>${b}  Log To Console  ${a} is greater than ${b}
    ...  ELSE IF  ${b}>${a}  Log To Console  ${b} is greater than ${a}
    ...  ELSE  Log To Console  Both ${a} and ${b} are equal
