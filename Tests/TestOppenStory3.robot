*** Settings ***
Documentation    As the Clerk, I should be able to upload a csv file to a portal so that I can populate the database from a UI
Resource        ../Resources/Oppen.robot
Resource        ../Resources/Common.robot

*** Variables ***


*** Test Cases ***
Clerk should be able to upload a csv file to a portal
    [Documentation]    Happy case
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Upload CSV file
    Oppen.Verify Heroes are successfully uploaded
    Common.End Web Test

Clerk should not be able to upload a csv file without headers
    [Documentation]    AC1-First row of the csv file must be natid, name, gender, salary, birthday, tax
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Upload CSV file with no headers
    Oppen.Verify Heroes not uploaded
    Common.End Web Test

Clerk should not be able to upload a csv file with an empty line
    [Documentation]    AC2-Subsequent rows of csv are the relevant details of each working class hero
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Upload CSV file with empty line
    Oppen.Verify Heroes not uploaded
    Common.End Web Test

Clerk should be able to use a button on the loading page for upload csv
    [Documentation]    AC3-A simple button that allows me to upload a file on my pc to the portal
    [Tags]      functional2
    Common.Begin Web Test
    landingpage.verify 'Upload Csv' is on page
    Common.End Web Test



*** Keywords ***
