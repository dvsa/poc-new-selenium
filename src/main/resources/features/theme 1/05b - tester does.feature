@regression
Feature: 05b - Tester does...

  Scenario: Tester enters a class 4 MOT test pass, with advisory and PRS defects, checks slot usage
    Given I load "VEHICLE_CLASS_4" as {registration1}, {vin1}, {mileage1}
    And I login with 2FA using "MOT_TESTER_CLASS_4_WITH_ONLY_ONE_SITE" as {username1}, {site}
    And I get the slot count from the homepage for site {site}

    When I start an MOT test for {registration1}, {vin1}, {site}
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And I enter an odometer reading in miles of {mileage1} plus 5000
    And I browse for a "PRS" defect of ("Brakes", "Rigid brake pipes", "Imminent risk of failure or fracture") with comment "Test prs 1"
    And I search for a "PRS" defect of "Handlebar fractured to the extent that steering is adversely affected" with comment "Test prs 2"
    And I browse for a "Advisory" defect of ("Non-component advisories", "Spare tyre defective") with comment "Test advisory 1"
    And I search for a "Advisory" defect of "Stub axle has slight vertical movement between stub axle and axle beam" with comment "Test advisory 2"
    And I enter decelerometer service brake result of 60 and gradient parking brake result of "Pass"
    And I press the "Review test" button

    Then The page title contains "MOT test summary"
    And I check the registration plate {registration1} is shown within the registration number span text
    And I check the VIN {vin1} is shown within the VIN span text
    And I check the vehicle summary section of the test summary has "Result" of "PASS"
    And I check the brake test summary section has "Brake results overall" of "Pass"

    And I check the prs section of the test summary has "Brake pipe at imminent risk of failure or fracture"
    And I check the prs section of the test summary has "Handlebar fractured to the extent that steering is adversely affected"
    And I check the prs section of the test summary has "Test prs 1"
    And I check the prs section of the test summary has "Test prs 2"
    And I check the advisory section of the test summary has "Spare tyre defective"
    And I check the advisory section of the test summary has "Stub axle has slight vertical movement between stub axle and axle beam"
    And I check the advisory section of the test summary has "Test advisory 1"
    And I check the advisory section of the test summary has "Test advisory 2"
    And I check the dangerous failures section of the test summary has "None recorded"
    And I check the major failures section of the test summary has "None recorded"
    And I check the minors section of the test summary has "None recorded"

    And I press the "Save test result" button
    And The page title contains "MOT test complete"
    And I click "Print documents" and check the PDF contains:
      | VT20                                                  |
      | Brake pipe at imminent risk of failure or fracture    |
      | Handlebar fractured to the extent that steering is adversely affected                  |
      | Test prs 1                                            |
      | Test prs 2                                            |
      | Stub axle has slight vertical movement between stub axle and axle beam       |
      | Spare tyre defective                                              |
      | Test advisory 1                                       |
      | Test advisory 2                                       |
      | {registration1}                                       |
      | {vin1}                                                |
    And I click the "Back to user home" link
    And I check a slot was successfully used for site {site}


  Scenario: Tester enters a class 4 MOT test fail, add edit and remove advisory, PRS and failure defects
    Given I load "VEHICLE_CLASS_4" as {registration1}, {vin1}, {mileage1}
    And I login with 2FA using "MOT_TESTER_CLASS_4" as {username1}, {site}

    When I start an MOT test for {registration1}, {vin1}, {site}
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And I enter an odometer reading in miles of {mileage1} plus 5000

    And I browse for a "Advisory" defect of ("Road wheels", "Condition", "Fractured at bridge over valve") with comment "Test advisory 1"
    And I search for a "Advisory" defect of "Stub axle has slight vertical movement between stub axle and axle beam" with comment "Test advisory 2"
    And I edit the "Advisory" defect of "Road wheel fractured at bridge over valve" with comment "Edited advisory 1" and not dangerous
    And I remove the "Advisory" defect of "Stub axle has slight vertical movement between stub axle and axle beam"

    And I browse for a "PRS" defect of ("Suspension", "Wheel bearings", "Rough when rotated") with comment "Test prs 1"
    And I search for a "PRS" defect of "Handlebar fractured to the extent that steering is adversely affected" with comment "Test prs 2"
    And I edit the "PRS" defect of "Wheel bearing rough when rotated" with comment "Edited prs 1" and not dangerous
    And I remove the "PRS" defect of "Handlebar fractured to the extent that steering is adversely affected"

    And I browse for a "Dangerous" defect of ("Steering", "Steering column", "Fractured, steering affected") with comment "Test defect 1"
    And I search for a "Major" defect of "Exhaust system insecure" with comment "Test defect 2"
    And I remove the "Dangerous" defect of "Steering column fractured to the extent that steering is affected"
    And I edit the "Major" defect of "Exhaust system insecure" with comment "Edited failure 2" and not dangerous

    And I enter decelerometer service brake result of 61 and gradient parking brake result of "Pass"
    And I press the "Review test" button

    Then The page title contains "MOT test summary"
    And I check the registration plate {registration1} is shown within the registration number span text
    And I check the VIN {vin1} is shown within the VIN span text
    And I check the vehicle summary section of the test summary has "Result" of "FAIL"
    And I check the brake test summary section has "Brake results overall" of "Pass"

    And I check the major failures section of the test summary has "Exhaust system insecure"
    And I check the major failures section of the test summary has "Edited failure 2"
    And I check the dangerous failures section of the test summary does not have "Steering column fractured to the extent that steering is affected"
    And I check the major failures section of the test summary does not have "Test defect 1"

    And I check the prs section of the test summary has "Wheel bearing rough when rotated"
    And I check the prs section of the test summary has "Edited prs 1"
    And I check the prs section of the test summary does not have "Handlebar fractured to the extent that steering is adversely affected"
    And I check the prs section of the test summary does not have "Test prs 2"

    And I check the advisory section of the test summary has "Road wheel fractured at bridge over valve"
    And I check the advisory section of the test summary has "Edited advisory 1"
    And I check the advisory section of the test summary does not have "Stub axle has slight vertical movement between stub axle and axle beam"
    And I check the advisory section of the test summary does not have "Test advisory 2"

    And I check the dangerous failures section of the test summary has "None recorded"
    And I check the minors section of the test summary has "None recorded"

    And I press the "Save test result" button
    And The page title contains "MOT test complete"
    And I click "Print documents" and check the PDF contains:
      | VT30                                                                 |
      | Exhaust system insecure                                              |
      | Edited failure 2                                                     |
      | Wheel bearing rough when rotated                                     |
      | Edited prs 1                                                         |
      | Road wheel fractured at bridge over valve                            |
      | Edited advisory 1                                                    |
      | {registration1}                                                      |
      | {vin1}                                                               |
    And I click the "Back to user home" link


  Scenario: Tester aborts an MOT test
    Given I load "VEHICLE_CLASS_4" as {registration1}, {vin1}, {mileage1}
    And I login with 2FA using "MOT_TESTER_CLASS_4" as {username1}, {site}

    When I start an MOT test for {registration1}, {vin1}, {site}
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And The page title contains "MOT test results"
    And I click the "Cancel test" link

    And The page title contains "Cancel test"
    And I click the "Aborted by VE" radio button
    And I press the "Cancel test" button
    Then The page contains "MOT test cancelled"
    And I click "Print certificate" and check the PDF contains:
      | VT30            |
      | {registration1} |
      | {vin1}          |

  @smoke
  Scenario: Tester enters a class 4 MOT retest pass, all failures repaired, no need to repeat brake test
    Given I load "VEHICLE_CLASS_4" as {registration1}, {vin1}, {mileage1}
    And I login with 2FA using "MOT_TESTER_CLASS_4" as {username1}, {site}

    And I start an MOT test for {registration1}, {vin1}, {site}
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And I enter an odometer reading in miles of {mileage1} plus 5000
    And I browse for a "Dangerous" defect of ("Body, chassis, structure", "Engine mounting", "Engine mounting condition", "Fractured") with comment "Test defect 1"
    And I browse for a "Major" defect of ("Brakes", "Rigid brake pipes", "Likely to become detached or damaged") with comment "Test defect 2"
    And I browse for a "Major" defect of ("Steering", "Steering column", "Excessive movement up and down") with comment "Test defect 3"
    And I add a manual advisory of "Test manual advisory"
    And I enter decelerometer results of service brake 61 and parking brake 16
    And I press the "Review test" button

    And The page title contains "MOT test summary"
    And I check the registration plate {registration1} is shown within the registration number span text
    And I check the VIN {vin1} is shown within the VIN span text
    And I check the vehicle summary section of the test summary has "Result" of "FAIL"
    And I check the brake results section of the test summary is "Pass"
    And I check the advisory section of the test summary has "Test manual advisory"
    And I check the dangerous failures section of the test summary has "Engine mounting fractured"
    And I check the dangerous failures section of the test summary has "Test defect 1"
    And I check the major failures section of the test summary has "Brake pipe likely to become detached or damaged"
    And I check the major failures section of the test summary has "Test defect 2"
    And I check the major failures section of the test summary has "Steering column has excessive movement up and down"
    And I check the major failures section of the test summary has "Test defect 3"
    And I check the minors section of the test summary has "None recorded"
    And I check the prs section of the test summary has "None recorded"
    And I record the MOT test number
    And I press the "Save test result" button
    And The page title contains "MOT test complete"
    And I click "Print documents" and check the PDF contains:
      | Refusal of MOT test certificate                    |
      | VT30                                               |
      | Engine mounting fractured                          |
      | Test defect 1                                      |
      | Brake pipe likely to become detached or damaged    |
      | Test defect 2                                      |
      | Steering column has excessive movement up and down |
      | Test defect 3                                      |
      | {registration1}                                    |
      | {vin1}                                             |

    When I click the "Back to user home" link
    And I start an MOT retest for {registration1}, {vin1}, {site}
    And The page title contains "Your home"
    And I click the "Enter retest results" link

    And I enter an odometer reading in miles of {mileage1} plus 5000
    And I mark the defect "Engine mounting fractured " as repaired
    And I mark the defect "Brake pipe likely to become detached or damaged" as repaired
    And I mark the defect "Steering column has excessive movement up and down" as repaired
    And I mark the manual advisory defect as repaired
    And I press the "Review test" button

    Then The page title contains "MOT re-test summary"
    And I check the registration plate {registration1} is shown within the registration number span text
    And I check the VIN {vin1} is shown within the VIN span text
    And I check the vehicle summary section of the test summary has "Result" of "PASS"
    And I check the brake results section of the test summary is "None Recorded"
    And I check the dangerous failures section of the test summary has "None recorded"
    And I check the major failures section of the test summary has "None recorded"
    And I check the minors section of the test summary has "None recorded"
    And I check the prs section of the test summary has "None recorded"
    And I check the advisory section of the test summary has "None recorded"
    And I record the MOT test number
    And I press the "Save test result" button
    And The page title contains "MOT re-test complete"
    And I click "Print documents" and check the PDF contains:
      | MOT test certificate |
      | VT20                 |
      | {registration1}      |
      | {vin1}               |
    And I click the "Back to user home" link


  Scenario: Tester enters a class 4 MOT retest fail, with brake test re-entry
    Given I load "VEHICLE_CLASS_4" as {registration1}, {vin1}, {mileage1}
    And I login with 2FA using "MOT_TESTER_CLASS_4" as {username1}, {site}

    And I start an MOT test for {registration1}, {vin1}, {site}
    And The page title contains "Your home"
    And I click the "Enter test results" link

    And I enter an odometer reading in miles of {mileage1} plus 5000
    And I browse for a "Dangerous" defect of ("Body, chassis, structure", "Engine mounting", "Bracket", "Excessively loose") with comment "Test defect 1"
    And I browse for a "Major" defect of ("Road wheels", "Hubs", "Excessively worn") with comment "Test defect 2"
    And I browse for a "Major" defect of ("Tyres", "Condition", "Fouling part of vehicle") with comment "Test defect 3"
    And I enter class 4 roller results for vehicle weight of 1000 as service brake 100,50,100,50 and parking brake 60,50
    And I press the "Review test" button

    And The page title contains "MOT test summary"
    And I check the registration plate {registration1} is shown within the registration number span text
    And I check the VIN {vin1} is shown within the VIN span text
    And I check the vehicle summary section of the test summary has "Result" of "FAIL"
    And I check the brake results section of the test summary is "Fail"
    And I check the dangerous failures section of the test summary has "Engine mounting bracket excessively loose"
    And I check the dangerous failures section of the test summary has "Test defect 1"
    And I check the major failures section of the test summary has "Wheel hub spigot mounting excessively worn"
    And I check the major failures section of the test summary has "Test defect 2"
    And I check the major failures section of the test summary has "Tyre fouling a part of the vehicle"
    And I check the major failures section of the test summary has "Test defect 3"
    And I check the major failures section of the brake test summary of the test summary has "Service brake efficiency below requirements"
    And I check the major failures section of the brake test summary of the test summary has "Parking brake efficiency below requirements"
    And I check the major failures section of the brake test summary of the test summary has "Brakes imbalanced across an axle"
    And I check the major failures section of the brake test summary of the test summary has "Front (Axle 1)"
    And I check the major failures section of the brake test summary of the test summary has "Rear (Axle 2)"
    And I check the minors section of the test summary has "None recorded"
    And I check the prs section of the test summary has "None recorded"
    And I check the advisory section of the test summary has "None recorded"
    And I press the "Save test result" button
    And The page title contains "MOT test complete"
    And I click "Print documents" and check the PDF contains:
      | VT30                                            |
      | Wheel hub spigot mounting excessively worn      |
      | Test defect 1                                   |
      | Tyre fouling a part of the vehicle              |
      | Test defect 2                                   |
      | Engine mounting bracket excessively loose       |
      | Test defect 3                                   |
      | Service brake efficiency below requirements     |
      | Parking brake efficiency below requirements     |
      | Brakes imbalanced across an axle Front (Axle 1) |
      | Brakes imbalanced across an axle Rear (Axle 2)  |
      | {registration1}                                 |
      | {vin1}                                          |

    When I click the "Back to user home" link
    And I start an MOT retest for {registration1}, {vin1}, {site}
    And The page title contains "Your home"
    And I click the "Enter retest results" link

    And I enter an odometer reading in miles of {mileage1} plus 5000
    And I mark the defect "Engine mounting bracket excessively loose" as repaired

    And I check the "Review test" button is disabled
    And I edit class 4 roller results for vehicle weight of 1000 as service brake 160,160,160,160 and parking brake 80,80
    And I press the "Review test" button

    Then The page title contains "MOT re-test summary"
    And I check the registration plate {registration1} is shown within the registration number span text
    And I check the VIN {vin1} is shown within the VIN span text
    And I check the vehicle summary section of the test summary has "Result" of "FAIL"
    And I check the major failures section of the test summary has "Wheel hub spigot mounting excessively worn"
    And I check the major failures section of the test summary has "Test defect 2"
    And I check the major failures section of the test summary has "Tyre fouling a part of the vehicle"
    And I check the major failures section of the test summary has "Test defect 3"
    And I check the major failures section of the brake test summary of the test summary does not have "Service brake efficiency below requirements"
    And I check the major failures section of the brake test summary of the test summary does not have "Parking brake efficiency below requirements"
    And I check the major failures section of the brake test summary of the test summary does not have "Brakes imbalanced across an axle"
    And I check the major failures section of the brake test summary of the test summary does not have "Front (Axle 1)"
    And I check the major failures section of the brake test summary of the test summary does not have "Rear (Axle 2)"
    And I check the major failures section of the brake test summary of the test summary has "None recorded"
    And I check the dangerous failures section of the test summary has "None recorded"
    And I check the minors section of the test summary has "None recorded"
    And I check the prs section of the test summary has "None recorded"
    And I check the advisory section of the test summary has "None recorded"
    And I press the "Save test result" button
    And The page title contains "MOT re-test complete"
    And I click "Print documents" and check the PDF contains:
      | VT30                                                      |
      | Wheel hub spigot mounting excessively worn                |
      | Test defect 2                                             |
      | Tyre fouling a part of the vehicle                        |
      | Test defect 3                                             |
      | {registration1}                                           |
      | {vin1}                                                    |
