@mothb2b
Feature: 02 - Check vehicle with current MOT


  Scenario: A B2B MOTH user searches for a vehicle with a current MOT
    Given I load "VEHICLE_REG_MOT_CURRENT_B2B" as {registration}, {make}, {model}, {first_used_date}, {expiry_date}, {number}
    And I invoke the b2b endpoint with registration {registration} and make {make}

    Then The first MOT result contains "vehicle-registration" equals {registration}
    And The first MOT result contains "vehicle-make" equals {make}
    And The first MOT result contains "vehicle-model" equals {model}
    And The first MOT result contains "vehicle-first-used-date" equals {first_used_date}
    And The first MOT result contains "test-expiry-date" equals {expiry_date}
    And The first MOT result contains "test-number" equals {number}


