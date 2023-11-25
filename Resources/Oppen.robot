*** Settings ***
Library    SeleniumLibrary      timeout=0:00:10
Library    String
Resource    ../Resources/PO/SwaggUIPage.robot
Resource    ../Resources/PO/LandingPage.robot

*** Variables ***


*** Keywords ***

Navigate to SwaggerUI
    click link      Visit Swagger
    wait until page contains    Api Documentation

#STORY1
Insert 1 hero via POST
    SwaggUIPage.Input 1 hero payload into textbox
    SwaggUIPage.Verify Success Message

Navigate to Insert 1 Person
    SwaggUIPage.Navigate to Insert 1 Person section
    SwaggUIPage.Click Try It button

Insert 1 hero without natId via POST
    SwaggUIPage.Input 1 hero without natId payload into textbox
    SwaggUIPage.Verify Internal Server Error Message

Insert 1 hero without name via POST
    SwaggUIPage.Input 1 hero without name payload into textbox
    SwaggUIPage.Verify Internal Server Error Message

Insert 1 hero without gender via POST
    SwaggUIPage.Input 1 hero without gender payload into textbox
    SwaggUIPage.Verify Internal Server Error Message

Insert 1 hero without Birthday via POST
    SwaggUIPage.Input 1 hero without Birthday payload into textbox
    SwaggUIPage.Verify Internal Server Error Message

Insert 1 hero without Salary via POST
    SwaggUIPage.Input 1 hero without Salary payload into textbox
    SwaggUIPage.Verify Internal Server Error Message

Insert 1 hero without Tax Paid via POST
    SwaggUIPage.Input 1 hero without Tax Paid payload into textbox
    SwaggUIPage.Verify Internal Server Error Message
#STORY2
Insert multiple heroes via POST
    SwaggUIPage.Navigate to Insert Multiple Persons section
    SwaggUIPage.Click Try It button2
    SwaggUIPage.Input multiple heroes payload into textbox
    SwaggUIPage.Verify Success Message
#STORY3
Upload CSV file
    LandingPage.Get Number of heros before upload
    LandingPage.Click on UPLOAD CSV FILE
    LandingPage.Choose file to upload
    LandingPage.Get Number of heros after upload

Verify Heroes are successfully uploaded
    LandingPage.Verify Heroes are successfully uploaded

Upload CSV file with no headers
    LandingPage.Get Number of heros before upload
    LandingPage.Click on UPLOAD CSV FILE
    LandingPage.Choose file with no headers to upload
    LandingPage.Get Number of heros after upload

Verify Heroes not uploaded
    LandingPage.Verify Heroes are not uploaded

Upload CSV file with empty line
    LandingPage.Get Number of heros before upload
    LandingPage.Click on UPLOAD CSV FILE
    LandingPage.Choose file with empty line to upload
    LandingPage.Get Number of heros after upload

#STORY4
Click 'Refresh Tax Relief Table' button
    click button    Refresh Tax Relief Table

Verify table columns
    LandingPage.Verify table has natId column
    LandingPage.Verify table has text relief column

Verify inserted Hero is in the table
    LandingPage.Get Number of heros
    LandingPage.Get and Verify hero content

Get Tax Relief via Get interface
    SwaggUIPage.Navigate to Get Tax Relief Section
    SwaggUIPage.Click Try It button3

Verify contents has required fields
    SwaggUIPage.Get response body from UI
    SwaggUIPage.Sparse and verify natID, name, relief fields

Verify natID has $ from 5 chacter onwards
    SwaggUIPage.Get response body from UI
    SwaggUIPage.Sparse and verify natID field has mask first 5 char

Verify Tax Relief is calculated correctly
    LandingPage.Get Number of heros
    LandingPage.Check taxRelief is calulated correctly

Verify Pioneer Tax Relief is calculated correctly
    LandingPage.Get Number of heros
    LandingPage.Check Pioneer taxRelief is calulated correctly

Verify Rounding Tax Relief is calculated correctly
    LandingPage.Get Number of heros
    LandingPage.Check Rounding taxRelief is calulated correctly

Verify Female35 Tax Relief is calculated correctly
    LandingPage.Get Number of heros
    LandingPage.Check Female35 taxRelief is calulated correctly

Verify Male50 Tax Relief is calculated correctly
    LandingPage.Get Number of heros
    LandingPage.Check Male50 taxRelief is calulated correctly

Verify Female75 Tax Relief is calculated correctly
    LandingPage.Get Number of heros
    LandingPage.Check Female75 taxRelief is calulated correctly

Verify Male76 Tax Relief is calculated correctly
    LandingPage.Get Number of heros
    LandingPage.Check Male76 taxRelief is calulated correctly
#STORY5
Verify 'Dispense Now' button is red
    LandingPage.Get colour of the button
    LandingPage.Sparse the rbga value
    LandingPage.Verify that the button is red

Click on 'Dispense Now' button
    LandingPage.Click on 'Dispense Now'

Verify 'Cash dispensed' appears on page
    page should contain    Cash dispensed

Verify text on button is 'Dispense Now'
    LandingPage.Get text on the 'Dispense Now' button
    LandingPage.Check that the text is Dispense Now
