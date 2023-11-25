*** Settings ***
Library    SeleniumLibrary
Library    RequestsLibrary
Resource    ../Resources/PO/LandingPage.robot
*** Variables ***



*** Keywords ***
Begin Web Test
    LandingPage.Load
    LandingPage.VerifyPageLoaded

End Web Test
    close browser

Insert Hero via Rest Call
    ${body} =    Create Dictionary    birthday=01012005  gender=M    name=Hans    natid=1234567890    salary=50000.00    tax=4000.00
    ${response} =    POST    url=http://localhost:8080/calculator/insert    json=${body}
    log to console    ${response}

Insert Pioneer Hero via Rest Call
    ${body} =    Create Dictionary    birthday=01011949  gender=M    name=Darth Vader    natid=1234567890    salary=134.60    tax=0.00
    ${response} =    POST    url=http://localhost:8080/calculator/insert    json=${body}
    log to console    ${response}

Insert Rounding Hero via Rest Call
    ${body} =    Create Dictionary    birthday=01011949  gender=M    name=Nameless Swordman    natid=1234567890    salary=12135.00    tax=0.00
    ${response} =    POST    url=http://localhost:8080/calculator/insert    json=${body}
    log to console    ${response}

Insert Female35 Hero via Rest Call
    ${body} =    Create Dictionary    birthday=01011988  gender=F    name=Natasha    natid=1234567890    salary=50000.00    tax=4000.00
    ${response} =    POST    url=http://localhost:8080/calculator/insert    json=${body}
    log to console    ${response}

Insert Male50 Hero via Rest Call
    ${body} =    Create Dictionary    birthday=01011973  gender=M    name=Clint Barton    natid=1234567890    salary=50000.00    tax=4000.00
    ${response} =    POST    url=http://localhost:8080/calculator/insert    json=${body}
    log to console    ${response}

Insert Female75 Hero via Rest Call
    ${body} =    Create Dictionary    birthday=01011948  gender=F    name=Penny    natid=1234567890    salary=50000.00    tax=4000.00
    ${response} =    POST    url=http://localhost:8080/calculator/insert    json=${body}
    log to console    ${response}

Insert Male76 Hero via Rest Call
    ${body} =    Create Dictionary    birthday=01011947  gender=M    name=Steve Rogers    natid=1234567890    salary=50000.00    tax=4000.00
    ${response} =    POST    url=http://localhost:8080/calculator/insert    json=${body}
    log to console    ${response}

Delete All Heroes via Rest Call
    ${response} =    POST    url=http://localhost:8080/calculator/rakeDatabase
    log to console    ${response}