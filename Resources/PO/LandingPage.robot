*** Settings ***
Library    SeleniumLibrary
Library    String
*** Variables ***

${BROWSER} =    headlesschrome
${TESTURL} =    http://localhost:8080
${TaxRelief_Table} =    //table[@class='table table-hover table-dark']/tbody/tr
${Upload_CSV_Section} =     //div[@class='custom-file']
${Upload_CSV_input} =     xpath=//input[@class='custom-file-input']
${Table_header_1} =       //table[@class='table table-hover table-dark']/thead/tr[1]/th[1]
${Table_header_2} =       //table[@class='table table-hover table-dark']/thead/tr[1]/th[2]
${Table_data_natID} =     //table[@class='table table-hover table-dark']/tbody/tr/td[1]
${Table_data_Relief} =     //table[@class='table table-hover table-dark']/tbody/tr/td[2]
${Dispense_Button} =    xpath=//a[@href='dispense']


*** Keywords ***
Load
       open browser    ${TESTURL}     ${BROWSER}

VerifyPageLoaded
    wait until page contains    The Oppenheimer Project

Get Number of heros before upload
    ${countRowsBefore} =  get element count  ${TaxRelief_Table}
    Set Test Variable    ${countRowsBefore}

Click on UPLOAD CSV FILE
    wait until element is visible    ${Upload_CSV_Section}
    click element    ${Upload_CSV_Section}

verify 'Upload Csv' is on page
    wait until element is visible    ${Upload_CSV_Section}

get csv relative path
    ${CSV_location} =   get substring    ${CURDIR}      0      -3
    set test variable    ${CSV_location}

Choose file to upload
    get csv relative path
    choose file     ${Upload_CSV_input}       ${CSV_location}\\OppenHeroes1.csv
    sleep   5s

Choose file with no headers to upload
    get csv relative path
    choose file     ${Upload_CSV_input}       ${CSV_location}\\OppenHeroes_Noheaders.csv
    sleep   5s

Choose file with empty line to upload
    get csv relative path
    choose file     ${Upload_CSV_input}       ${CSV_location}\\OppenHeroes2bad.csv
    sleep   5s

Get Number of heros after upload
    click button    Refresh Tax Relief Table
    ${countRowsAfter} =  get element count  ${TaxRelief_Table}
    Set Test Variable    ${countRowsAfter}

Verify Heroes are successfully uploaded
    ${countRowsFinal} =     evaluate    ${countRowsAfter} - ${countRowsBefore}
    Should Be Equal As Integers     ${countRowsFinal}    4

Verify Heroes are not uploaded
    ${countRowsFinal} =     evaluate    ${countRowsAfter} - ${countRowsBefore}
    Should Be Equal As Integers     ${countRowsFinal}    0

Get Number of heros
    ${countRows}=  get element count    ${TaxRelief_Table}
    should be equal as numbers    ${countRows}     1

Get and Verify hero content
    ${nationalID}=  get text    ${Table_data_natID}
    should be equal    ${nationalID}    1234$$$$$$
    ${taxRelief}=  get text    ${Table_data_Relief}
    should be equal as numbers    ${taxRelief}      46000.00

Verify table has natId column
    ${nationalID_header} =  get text    ${Table_header_1}
    should be equal    ${nationalID_header}     NatId

Verify table has text relief column
    ${Relief_header} =  get text    ${Table_header_2}
    should be equal    ${Relief_header}     Relief

Check taxRelief is calulated correctly
    ${taxRelief}=  get text    ${Table_data_Relief}
    ${taxReliefExpected}   evaluate    ((50000.00 - 4000.00) * 1) + 0
    should be equal as numbers     ${taxRelief}    ${taxReliefExpected}

Check Pioneer taxRelief is calulated correctly
    ${taxRelief}=  get text    ${Table_data_Relief}
    ${taxReliefExpected}   evaluate    50.00

Check Rounding taxRelief is calulated correctly
    ${taxRelief}=  get text    ${Table_data_Relief}
    ${taxReliefExpected}   evaluate    4453.55
    should be equal as numbers     ${taxRelief}    ${taxReliefExpected}

Check Female35 taxRelief is calulated correctly
    ${taxRelief}=  get text    ${Table_data_Relief}
    ${taxReliefExpected}   evaluate    ((50000.00 - 4000.00) * 0.8) + 500
    should be equal as numbers     ${taxRelief}    ${taxReliefExpected}

Check Male50 taxRelief is calulated correctly
    ${taxRelief}=  get text    ${Table_data_Relief}
    ${taxReliefExpected}   evaluate    ((50000.00 - 4000.00) * 0.5) + 0
    should be equal as numbers     ${taxRelief}    ${taxReliefExpected}

Check Female75 taxRelief is calulated correctly
    ${taxRelief}=  get text    ${Table_data_Relief}
    ${taxReliefExpected}   evaluate    ((50000.00 - 4000.00) * 0.367) + 500
    should be equal as numbers     ${taxRelief}    ${taxReliefExpected}

Check Male76 taxRelief is calulated correctly
    ${taxRelief}=  get text    ${Table_data_Relief}
    ${taxReliefExpected}   evaluate    ((50000.00 - 4000.00) * 0.05) + 0
    should be equal as numbers     ${taxRelief}    ${taxReliefExpected}

Get colour of the button
    ${colour} =   Get CSS Property Value  ${Dispense_Button}     background-color
    Set Test Variable    ${colour}

Sparse the rbga value
    ${endcolour}=   Get Substring       ${colour}    5   -1
    @{rbga}=    split string    ${endcolour}     ,
    Set Test Variable   @{rbga}

Verify that the button is red
    should be true    ${rbga[0]} > 200
    should be true    ${rbga[1]} < 80
    should be true    ${rbga[2]} < 80

Get CSS Property Value
    [Arguments]    ${locator}    ${attribute name}
    ${css}=         Get WebElement    ${locator}
    ${prop_val}=    Call Method       ${css}    value_of_css_property    ${attribute name}
    [Return]     ${prop_val}

Get text on the 'Dispense Now' button
    ${textButton} =     get text    ${Dispense_Button}
    set test variable    ${textButton}

Check that the text is Dispense Now
    should be equal    ${textButton}    Dispense Now

Click on 'Dispense Now'
    click element    ${Dispense_Button}