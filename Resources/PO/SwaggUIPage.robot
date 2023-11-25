*** Settings ***
Library    SeleniumLibrary
Library    String

*** Variables ***
#http payload for hero
${HERO} =   {"birthday":"11111990","gender":"F","name":"Sally","natid":"768768900J","salary":"30000.00","tax":"30.00"}
${HERO_no_name} =   {"birthday":"11111990","gender":"F","natid":"768768900J","salary":"30000.00","tax":"30.00"}
${HERO_no_gender} =     {"birthday":"11111990","name":"Sally","natid":"768768900J","salary":"30000.00","tax":"30.00"}
${HERO_no_natId} =     {"birthday":"11111990","name":"Sally","salary":"30000.00","tax":"30.00"}
${HERO_no_Birthday} =   {"gender":"F","name":"Sally","natid":"768768900J","salary":"30000.00","tax":"30.00"}
${HERO_no_Salary} =   {"birthday":"11111990","gender":"F","name":"Sally","natid":"768768900J","tax":"30.00"}
${HERO_no_TaxPaid} =   {"birthday":"11111990","gender":"F","name":"Sally","natid":"768768900J","salary":"30000.00"}

#http payload for lists hero
${2_HEROES} =   [{"birthday":"11111990","gender":"F","name":"JeanGrey","natid":"111111111","salary":"80000.00","tax":"80.00"},{"birthday":"20112000","gender":"M","name":"Cyclops","natid":"22222222","salary":"10000.00","tax":"10.00"}]

#locators Post 1
${Insert_1_Section} =   //div[@id='operations-calculator-controller-insertPersonUsingPOST_1']//div
${Insert_1_Try_It_Button} =     xpath=//div[@id='operations-calculator-controller-insertPersonUsingPOST_1']//button
${Insert_1_textInput} =   xpath=//div[@id='operations-calculator-controller-insertPersonUsingPOST_1']//textarea
${Insert_results} =     xpath=//table[@class='responses-table']/tbody/tr/td[1]

#locators Post
${Insert_Mulitple_Section} =    //div[@id='operations-calculator-controller-insertPersonUsingPOST']//div
${Insert_Mulitple_Try_It_Button} =   xpath=//div[@id='operations-calculator-controller-insertPersonUsingPOST']//button
${Insert_Mulitple_textInput} =   xpath=//div[@id='operations-calculator-controller-insertPersonUsingPOST']//textarea

#locators tax relief
${Get_Tax_relief_Section} =     //div[@id='operations-calculator-controller-getTaxReliefUsingGET']//div
${GetTaxRelief_Try_It_Button} =   xpath=//div[@id='operations-calculator-controller-getTaxReliefUsingGET']//button
${GetTaxRelief_text} =   //table[@class='responses-table']/tbody/tr[1]/td[2]//pre


*** Keywords ***
#STORY1
Navigate to Insert 1 Person section
    click link      calculator-controller
    click element       ${Insert_1_Section}

Click Try It button
    click button       ${Insert_1_Try_It_Button}

Input 1 hero payload into textbox
    Clear Element Text      ${Insert_1_textInput}
    input text    ${Insert_1_textInput}   ${HERO}
    click button    Execute

Input 1 hero without natId payload into textbox
    Clear Element Text      ${Insert_1_textInput}
    input text    ${Insert_1_textInput}   ${HERO_no_natId}
    click button    Execute

Input 1 hero without name payload into textbox
    Clear Element Text      ${Insert_1_textInput}
    input text    ${Insert_1_textInput}   ${HERO_no_name}
    click button    Execute

Input 1 hero without gender payload into textbox
    Clear Element Text      ${Insert_1_textInput}
    input text    ${Insert_1_textInput}   ${HERO_no_gender}
    click button    Execute

Input 1 hero without Birthday payload into textbox
    Clear Element Text      ${Insert_1_textInput}
    input text    ${Insert_1_textInput}   ${HERO_no_Birthday}
    click button    Execute

Input 1 hero without Salary payload into textbox
    Clear Element Text      ${Insert_1_textInput}
    input text    ${Insert_1_textInput}   ${HERO_no_Salary}
    click button    Execute

Input 1 hero without Tax Paid payload into textbox
    Clear Element Text      ${Insert_1_textInput}
    input text    ${Insert_1_textInput}   ${HERO_no_TaxPaid}
    click button    Execute

Verify Success Message
    wait until page contains    Alright

Verify Internal Server Error Message
    ${post_result} =    get text    ${Insert_results}
    ${end_result} =   Get Substring       ${post_result}    0   3
    should be equal    ${end_result}       500

#STORY2
Navigate to Insert Multiple Persons section
    click link      calculator-controller
    click element       ${Insert_Mulitple_Section}

Click Try It button2
    click button    ${Insert_Mulitple_Try_It_Button}

Input multiple heroes payload into textbox
    Clear Element Text      ${Insert_Mulitple_textInput}
    input text    ${Insert_Mulitple_textInput}   ${2_HEROES}
    click button    Execute

Navigate to Get Tax Relief Section
    click link      calculator-controller
    click element       ${Get_Tax_relief_Section}

#STORY4
Click Try It button3
    click button    ${GetTaxRelief_Try_It_Button}
    click button    Execute

Get response body from UI
    ${responseBody}=  get text    ${GetTaxRelief_text}
    Set Test Variable    ${responseBody}

Sparse and verify natID, name, relief fields
    ${responseJson}=    Evaluate   json.loads('''${responseBody}''')   json
    should be equal   ${responseJson[0]["natid"]}    1234$$$$$$
    should be equal   ${responseJson[0]["name"]}    Hans
    should be equal   ${responseJson[0]["relief"]}    46000.00

Sparse and verify natID field has mask first 5 char
    ${responseJson}=  Evaluate   json.loads('''${responseBody}''')   json
    ${endString}=   Get Substring      ${responseJson[0]["natid"]}    4   -1
    should be equal    ${endString}   $$$$$