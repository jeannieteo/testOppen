

*** Settings ***
Documentation    As the Clerk, I should be able to insert a single record of working class hero into database via an API
Resource        ../Resources/Oppen.robot
Resource        ../Resources/Common.robot

*** Test Cases ***
Clerk should be able to insert 1 working class hero
    [Documentation]    Positive Case - all fields are there
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Navigate to Insert 1 Person
    Oppen.Insert 1 hero via POST
    Common.End Web Test

Clerk should not be able to insert hero without natID
    [Documentation]    AC1 - Single record of a working class hero should consist of Natural Id (natid), Name, Gender, Birthday, Salary and Tax paid
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Navigate to Insert 1 Person
    Oppen.Insert 1 hero without natId via POST
    Common.End Web Test

Clerk should not be able to insert hero without name
    [Documentation]    AC1 - Single record of a working class hero should consist of Natural Id (natid), Name, Gender, Birthday, Salary and Tax paid
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Navigate to Insert 1 Person
    Oppen.Insert 1 hero without name via POST
    Common.End Web Test

Clerk should not be able to insert hero without gender
    [Documentation]    AC1 - Single record of a working class hero should consist of Natural Id (natid), Name, Gender, Birthday, Salary and Tax paid
    [Tags]      functional  fail
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Navigate to Insert 1 Person
    Oppen.Insert 1 hero without gender via POST
    Common.End Web Test

Clerk should not be able to insert hero without Birthday
    [Documentation]    AC1 - Single record of a working class hero should consist of Natural Id (natid), Name, Gender, Birthday, Salary and Tax paid
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Navigate to Insert 1 Person
    Oppen.Insert 1 hero without Birthday via POST
    Common.End Web Test

Clerk should not be able to insert hero without Salary
    [Documentation]    AC1 - Single record of a working class hero should consist of Natural Id (natid), Name, Gender, Birthday, Salary and Tax paid
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Navigate to Insert 1 Person
    Oppen.Insert 1 hero without Salary via POST
    Common.End Web Test

Clerk should not be able to insert hero without Tax Paid
    [Documentation]    AC1 - Single record of a working class hero should consist of Natural Id (natid), Name, Gender, Birthday, Salary and Tax paid
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Navigate to Insert 1 Person
    Oppen.Insert 1 hero without Tax Paid via POST
    Common.End Web Test