
import json

*** Settings ***
Documentation       As the Governor, I should be able to see a button on the screen so that I can dispense tax relief for my working class heroes
Library     SeleniumLibrary     timeout=0:00:10
Resource        ../Resources/Oppen.robot
Resource        ../Resources/Common.robot
*** Variables ***


*** Test Cases ***
Dispense Now Button on Landing Page should be Red
    [Documentation]     AC1-The button on the screen must be red-colored
    [Tags]      UI
    Common.Begin Web Test
    Oppen.Verify 'Dispense Now' button is red
    Common.End Web Test

Text on the button should be exactly “Dispense Now”
    [Documentation]     AC2-The text on the button must be exactly “Dispense Now”
    [Tags]      UI
    Common.Begin Web Test
    Oppen.Verify text on button is 'Dispense Now'
    Common.End Web Test

Governor should be directed to “Cash dispensed” page
    [Documentation]     AC3-After clicking on the button, it should direct me to a page with a text that says “Cash dispensed”
    [Tags]      UI2
    Common.Begin Web Test
    Oppen.Click on 'Dispense Now' button
    Oppen.Verify 'Cash dispensed' appears on page
    Common.End Web Test



*** Keywords ***
