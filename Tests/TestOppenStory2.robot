

*** Settings ***
Resource        ../Resources/Oppen.robot
Resource        ../Resources/Common.robot
*** Variables ***


*** Test Cases ***
Clerk should be able to insert mulitple working class hero
    [Documentation]    As the Clerk, I should be able to insert more than one working class hero into database via an API
    [Tags]      functional
    Common.Begin Web Test
    Oppen.Navigate to SwaggerUI
    Oppen.Insert multiple heroes via POST
    Common.End Web Test
