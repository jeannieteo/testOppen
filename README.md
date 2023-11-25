# testOppen
Technical Challenge - RobotFramework (5 User Stories)

---Tests Folder----
    5 robots files in Tests directory, 1 for each user story


---Resources Folder----
  PO folder for 2 Page Object files 
  1. The Oppenheimer Project Landing Page
  2. SwaggerUI Page 
  Oppen.robot file for The Oppenheimer Project actions
  Common.robot file for common actions
  all the csv files


---Results---
  For test results html

#How to execute all tests
Step 1: cd to the project directory
Step 2: robot --exclude fail -d Results Tests

#How to execute by user story 
robot --exclude fail -d Results Tests/TestOppenStory1.robot

I exclude the fail because 1 test will crash the The Oppenheimer Project.
This case attempted to insert a hero without gender via REST API POST call, 
the return was 202, payload was inserted. When load the landing page, it has ERROR. 
See Link. https://youtu.be/LUHdXn8R-6M
