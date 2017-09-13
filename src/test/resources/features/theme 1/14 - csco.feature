@regression
Feature: 14 - CSCO

  Scenario: CSCO user performs AE search, then views AE details
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "AUTHORISED_EXAMINER" as {aeNumber}, {aeName}, {slotUsage}
    And I click the "AE information" link
    When I enter {aeNumber} in the "AE Number" field
    And I press the "Search" button
    And I check the "Authorised Examiner ID" field row has value {aeNumber}


  Scenario: CSCO user performs Site Information search by town, then views site details
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "SITE_LOCATION_INFORMATION" as {sid}, {sName}, {sNumber}, {aTown}, {aPostcode}
    And I click the "Site information" link
    When I enter {aTown} in the "town" field
    And I press the "Search" button
    And I check the "City/postcode" field column has value {aTown}


  Scenario: CSCO user performs Site Information search by postcode, then views site details
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "SITE_LOCATION_INFORMATION" as {sid}, {sName}, {sNumber}, {aTown}, {aPostcode}
    And I click the "Site information" link
    When I enter {aPostcode} in the "Postcode (full or part)" field
    Then I press the "Search" button
    And I check the "Address" field row has value {aPostcode}


    #Scenario: User Search - Update user's email
    #Selects user search
    #Enter First name and Last name
    #Select search
    #Select user
    #Find Email
    #Select change
    #Enter new Email address
    #Enter Re-type email address
    #Select Change email address
    #Ensure the email address has updated


  #Limits on this Scenario because it sends off an email to reset the account
  #Scenario: User Search - Reclaim Account


  Scenario: CSCO user performs certificate search by vrm/registration, and is able to print duplicate certificate
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "VEHICLE_CLASS_4" as {reg}, {vin}, {mileage}
    And I search for certificates with reg {reg}
    And I click the first "View certificate" link
    And I check there is a "Print certificate" link


  Scenario: CSCO user performs certificate search by vin, and is able to print duplicate certificate
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "VEHICLE_CLASS_4" as {reg}, {vin}, {mileage}
    And I search for certificates with vin {vin}
    And I click the first "View certificate" link
    And I check there is a "Print certificate" link


  Scenario: CSCO user performs MOT test search by site, and is able to view test certificates
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "SITE" as {siteName}, {siteNumber}
    And I click the "MOT tests" link
    When I search for an mot by "Site (recent tests)" with {siteNumber}
    And I click the first "View" link
    Then The page contains "MOT test summary"
    And I check there is a "Print certificate" link


  Scenario: CSCO user performs MOT test search by tester, and is able to view test certificates
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "TESTER_WITH_2_MONTH_HISTORY" as {tester}
    And I click the "MOT tests" link
    When I search for an mot by "Tester (by date range)" with {tester} from 2 months ago
    And I click the first "View" link
    Then The page contains "MOT test summary"
    And I check there is a "Print certificate" link


  Scenario: CSCO user performs MOT test search by vin, and view the test details
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "VEHICLE_CLASS_4" as {reg}, {vin}, {mileage}
    And I click the "MOT tests" link
    When I search for an mot by "VIN/Chassis (comparison available)" with {vin}
    And I click the first "View" link
    Then The page contains "MOT test summary"
    And I check the vehicle summary section of the test summary has "VIN/Chassis number" of {vin}


  Scenario: CSCO user performs MOT test search by vrm/registration, and view the test details
    Given I login without 2FA using "CSCO_USER" as {cscouser}
    And I load "VEHICLE_CLASS_4" as {reg}, {vin}, {mileage}
    And I click the "MOT tests" link
    When I search for an mot by "Registration (comparison available)" with {reg}
    And I click the first "View" link
    Then The page contains "MOT test summary"
    And I check the vehicle summary section of the test summary has "Registration number" of {reg}