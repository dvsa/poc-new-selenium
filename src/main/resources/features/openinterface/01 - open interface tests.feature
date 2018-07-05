@openif
Feature: 01 - Open Interface Tests



  Scenario: Open Interface test for a vehicle with a current MOT
    Given I load "VEHICLE_CURRENT_MOT" as {registration}, {test_date}, {test_number}

    And I check if a "VEHICLE_CURRENT_MOT", with {registration} vrm, contains xpath values:
      | ./EnqResp/EnqRspBody/VRM        | registration |
      | ./EnqResp/EnqRspBody/TestNumber | test_number  |
      | ./EnqResp/EnqRspBody/TestDate   | test_date    |


  Scenario: Open Interface test for a vehicle with a current contingency MOT
    Given I load "VEHICLE_NEW_CONTINGENCY_MOT" as {registration}, {test_date}, {test_number}

    And I check if a "VEHICLE_NEW_CONTINGENCY_MOT", with {registration} vrm, contains xpath values:
      | ./EnqResp/EnqRspBody/VRM        | registration |
      | ./EnqResp/EnqRspBody/TestNumber | test_number  |
      | ./EnqResp/EnqRspBody/TestDate   | test_date    |


  Scenario: A MOTH user searches for a vehicle with no MOT
    Given I load "VEHICLE_NO_MOT" as {registration}

    And I check if a "VEHICLE_NO_MOT", with {registration} vrm, contains xpath values:
      | ./EnqResp/EnqRspBody/VRM | registration |



  Scenario: A MOTH user searches for a pre 1960 vehicle with no MOT
    Given I load "VEHICLE_PRE1960_NO_MOT" as {registration}

    And I check if a "VEHICLE_PRE1960_NO_MOT", with {registration} vrm, contains xpath values:
      | ./EnqResp/EnqRspBody/VRM        | registration |
      | ./EnqResp/EnqRspBody/Odometer   | 1960         |
      | ./EnqResp/EnqRspBody/TestNumber | 196019601960 |
      | ./EnqResp/EnqRspBody/ExpiryDate | 20190101     |
      | ./EnqResp/EnqRspBody/VTSNumber  | PRE1960      |
      | ./EnqResp/EnqRspBody/VTSTelNo   | PRE1960      |


  Scenario: A MOTH user searches for a pre 1960 vehicle with a current MOT
    Given I load "VEHICLE_PRE1960_CURRENT_MOT" as {registration}, {test_date}, {test_number}

    And I check if a "VEHICLE_PRE1960_NEW_MOT", with {registration} vrm, contains xpath values:
      | ./EnqResp/EnqRspBody/VRM        | registration |
      | ./EnqResp/EnqRspBody/TestNumber | test_number  |
      | ./EnqResp/EnqRspBody/TestDate   | test_date    |


  Scenario: A MOTH user searches for a pre 1960 vehicle with an expired MOT
    Given I load "VEHICLE_PRE1960_EXPIRED_MOT" as {registration}

    And I check if a "VEHICLE_PRE1960_EXPIRED_MOT", with {registration} vrm, contains xpath values:
      | ./EnqResp/EnqRspBody/VRM        | registration |
      | ./EnqResp/EnqRspBody/Odometer   | 1960         |
      | ./EnqResp/EnqRspBody/TestNumber | 196019601960 |
      | ./EnqResp/EnqRspBody/ExpiryDate | 20190101     |
      | ./EnqResp/EnqRspBody/VTSNumber  | PRE1960      |
      | ./EnqResp/EnqRspBody/VTSTelNo   | PRE1960      |