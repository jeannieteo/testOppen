
*** Settings ***
Documentation    As the Bookkeeper, I should be able to query the amount of tax relief for each person in the database so that I can report the figures to my Bookkeeping Manager
Library     SeleniumLibrary     timeout=0:00:10
Resource        ../Resources/Oppen.robot
Resource        ../Resources/Common.robot

*** Variables ***


*** Test Cases ***
Bookkeeper should be able to query the amount of tax relief
    [Documentation]     Bookkeeper should be able to query the amount of tax relief via 'Refresh Tax Relief Table' button
    [Tags]      functional
    Common.Delete All Heroes via Rest Call
    Common.Insert Hero via Rest Call
    Common.Begin Web Test
    Oppen.Click 'Refresh Tax Relief Table' button
    Oppen.Verify table columns
    Oppen.Verify inserted Hero is in the table
    Common.End Web Test

GET endpoint which returns a list consist of natid, tax relief amount and name
    [Documentation]    AC1-Check Swagger UI response body has natid, tax relief amount and name
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Get Tax Relief via Get interface
    Oppen.Verify contents has required fields
    Common.End Web Test


natid field must be masked from the 5th character onwards with dollar sign ‘$’
    [Documentation]      AC2-Check NatId field is masked with $
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Get Tax Relief via Get interface
    Oppen.Verify natID has $ from 5 chacter onwards
    Common.End Web Test

Tax Relief should be correct if Male Hero is under 18
    [Documentation]     AC3-computation of the tax relief is using the formula as described
    [Tags]      functional
    Common.Delete All Heroes via Rest Call
    Common.Insert Hero via Rest Call
    Common.Begin Web Test
    Oppen.Click 'Refresh Tax Relief Table' button
    Oppen.Verify Tax Relief is calculated correctly
    Common.End Web Test

Tax Relief should be correct if Female Hero is under 35
    [Documentation]     AC3-computation of the tax relief is using the formula as described
    [Tags]      functional
    Common.Delete All Heroes via Rest Call
    Common.Insert Female35 Hero via Rest Call
    Common.Begin Web Test
    Oppen.Click 'Refresh Tax Relief Table' button
    Oppen.Verify Female35 Tax Relief is calculated correctly
    Common.End Web Test

Tax Relief should be correct if Male Hero is under 50
    [Documentation]     AC3-computation of the tax relief is using the formula as described
    [Tags]      functional
    Common.Delete All Heroes via Rest Call
    Common.Insert Male50 Hero via Rest Call
    Common.Begin Web Test
    Oppen.Click 'Refresh Tax Relief Table' button
    Oppen.Verify Male50 Tax Relief is calculated correctly
    Common.End Web Test

Tax Relief should be correct if Female Hero is under 75
    [Documentation]     AC3-computation of the tax relief is using the formula as described
    [Tags]      functional
    Common.Delete All Heroes via Rest Call
    Common.Insert Female75 Hero via Rest Call
    Common.Begin Web Test
    Oppen.Click 'Refresh Tax Relief Table' button
    Oppen.Verify Female75 Tax Relief is calculated correctly
    Common.End Web Test

Tax Relief should be correct if Male Hero is 76
    [Documentation]     AC3-computation of the tax relief is using the formula as described
    [Tags]      functional
    Common.Delete All Heroes via Rest Call
    Common.Insert Male76 Hero via Rest Call
    Common.Begin Web Test
    Oppen.Click 'Refresh Tax Relief Table' button
    Oppen.Verify Male76 Tax Relief is calculated correctly
    Common.End Web Test

Tax Relief should be rounded 50.00 if tax relief less than 50
    [Documentation]    AC5-If the calculated tax relief amount after subjecting to normal rounding rule is more than 0.00 but less than 50.00, the final taxrelief amount should be 50.00
    [Tags]      functional
    Common.Delete All Heroes via Rest Call
    Common.Insert Pioneer Hero via Rest Call
    Common.Begin Web Test
    Oppen.Click 'Refresh Tax Relief Table' button
    Oppen.Verify Pioneer Tax Relief is calculated correctly
    Common.End Web Test


Tax Relief should be rounded 2 decimal places
    [Documentation]    AC-6 If the calculated tax relief amount before applying the normal rounding rule gives a value with more than 2 decimal places, it should be truncated at the second decimal place and then subjected to normal rounding rule
    [Tags]      functional
    Common.Delete All Heroes via Rest Call
    Common.Insert Rounding Hero via Rest Call
    Common.Begin Web Test
    Oppen.Click 'Refresh Tax Relief Table' button
    Oppen.Verify Rounding Tax Relief is calculated correctly
    Common.End Web Test

    #NOTES:
    #AC4-After calculating the tax relief amount, it should be subjected to normal rounding rule to remove any decimal places
    #SO 2 DECIMAL PLACES OR NO DECIMAL PLACES for calculated tax?
*** Keywords ***
