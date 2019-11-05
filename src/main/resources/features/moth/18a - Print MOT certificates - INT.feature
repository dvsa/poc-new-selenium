@mothint
Feature: 18 - Check whether MOT certificates can be downloaded after entering the correct V5C number

  Scenario: A MOTH user searches for a vehicle with an pass MOT test and downloads the English MOT certificate
    Given I browse to /
    And I enter "CGSENOK" in the registration field
    When I press the "Continue" button

    And I click the accordion section with the id "mot-history-description"
    And I click the View test certificate link for test number "9999 9999 00"
    Then The page contains "Enter latest V5C number"

    And I enter "12312312312" in the v5c certificate field for test number "9999 9999 00"
    And I press the Show test certificate button for test number "9999 9999 00"
    Then The page contains "View certificate"
    And I check the "Return to MOT test history" button is enabled

    Given I click the button with id "cert-download-link"
    When I go to the next tab
    Then PDF is embedded in the page

    When I go to the next tab
    Then I click the certificate link and check the MOT certificate PDF contains:
      | MOT test certificate                    |
      | Duplicate certificate issued by DVSA on |
      | Issued by DVSA                          |
      | VT20/2.0                                |
      | CGSENOK                                 |
      | 99 9999 9900                            |
    Then I go to the next tab

  Scenario: A MOTH user searches for a vehicle with an pass MOT test and downloads the Welsh MOT certificate
    Given I browse to /
    And I enter "CGSCYOK" in the registration field
    When I press the "Continue" button

    And I click the accordion section with the id "mot-history-description"
    And I click the View test certificate link for test number "9999 9999 02"
    Then The page contains "Enter latest V5C number"

    And I enter "12312312312" in the v5c certificate field for test number "9999 9999 02"
    And I press the Show test certificate button for test number "9999 9999 02"
    Then The page contains "View certificate"
    And I check the "Return to MOT test history" button is enabled

    Given I click the button with id "cert-download-link"
    When I go to the next tab
    Then PDF is embedded in the page

    When I go to the next tab
    Then I click the certificate link and check the MOT certificate PDF contains:
      | MOT test certificate                                    |
      | Tystysgrif prawf MOT                                    |

      | Duplicate certificate issued by DVSA on                 |
      | Dyblyg wedi ei gyhoeddi gan ASGC ar                     |

      | Body not fully secure [6.2.2 (a) (i)]                   |
      | Air/vacuum reservoir slightly corroded [1.1.9 (a) (ii)] |
      | Corff: nid yw'n gwbl ddiogel [6.2.2 (a) (i)]            |
      | Cronfa aer/gwactod: wedi rhydu ychydig [1.1.9 (a) (ii)] |

      | Issued by DVSA                                          |
      | Cyhoeddwyd gan ASGC                                     |

      | VT20/2.0                                                |
      | CGSCYOK                                                 |
      | 99 9999 9902                                            |
    Then I go to the next tab

  Scenario: A MOTH user searches for a vehicle with an failed MOT test and downloads the English MOT certificate
    Given I browse to /
    And I enter "CGSENFP" in the registration field
    When I press the "Continue" button

    And I click the accordion section with the id "mot-history-description"
    And I click the View test certificate link for test number "9999 9999 04"
    Then The page contains "Enter latest V5C number"

    And I enter "12312312312" in the v5c certificate field for test number "9999 9999 04"
    And I press the Show test certificate button for test number "9999 9999 04"
    Then The page contains "View certificate"
    And I check the "Return to MOT test history" button is enabled

    Given I click the button with id "cert-download-link"
    When I go to the next tab
    Then PDF is embedded in the page

    When I go to the next tab
    Then I click the certificate link and check the MOT certificate PDF contains:
      | Refusal of MOT test certificate         |
      | Duplicate certificate issued by DVSA on |
      | Fuel hose damaged [6.1.3 (c) (ii)]      |
      | Issued by DVSA                          |
      | VT30/2.0                                |
      | CGSENFP                                 |
      | 99 9999 9904                            |
    Then I go to the next tab

  Scenario: A MOTH user searches for a vehicle with an failed MOT test and downloads the Welsh MOT certificate
    Given I browse to /
    And I enter "CGSCYFP" in the registration field
    When I press the "Continue" button

    And I click the accordion section with the id "mot-history-description"
    And I click the View test certificate link for test number "9999 9999 21"
    Then The page contains "Enter latest V5C number"

    And I enter "12312312312" in the v5c certificate field for test number "9999 9999 21"
    And I press the Show test certificate button for test number "9999 9999 21"
    Then The page contains "View certificate"
    And I check the "Return to MOT test history" button is enabled

    Given I click the button with id "cert-download-link"
    When I go to the next tab
    Then PDF is embedded in the page

    When I go to the next tab
    Then I click the certificate link and check the MOT certificate PDF contains:
      | MOT test certificate                            |
      | Gwrthodiad tystysgrif prawf MOT                 |

      | Duplicate certificate issued by DVSA on         |
      | Dyblyg wedi ei gyhoeddi gan ASGC ar             |

      | Fuel hose damaged [6.1.3 (c) (ii)]              |
      | Peipen danwydd hyblyg: difrodi [6.1.3 (c) (ii)] |

      | Issued by DVSA                                  |
      | Cyhoeddwyd gan ASGC                             |

      | VT30W/2.0                                       |
      | CGSCYFP                                         |
      | 99 9999 9921                                    |
    Then I go to the next tab

  Scenario: A MOTH user searches for a vehicle with an PRS pass MOT test and downloads the English MOT certificate
    Given I browse to /
    And I enter "CGSENFP" in the registration field
    When I press the "Continue" button

    And I click the accordion section with the id "mot-history-description"
    And I click the View test certificate link for test number "9999 9999 06"
    Then The page contains "Enter latest V5C number"

    And I enter "1231 2312 312" in the v5c certificate field for test number "9999 9999 06"
    And I press the Show test certificate button for test number "9999 9999 06"
    Then The page contains "View certificate"
    And I check the "Return to MOT test history" button is enabled

    Given I click the button with id "cert-download-link"
    When I go to the next tab
    Then PDF is embedded in the page

    When I go to the next tab
    Then I click the certificate link and check the MOT certificate PDF contains:
      | MOT test certificate                    |
      | Duplicate certificate issued by DVSA on |
      | Issued by DVSA                          |
      | VT20/2.0                                |
      | CGSENFP                                 |
      | 99 9999 9906                            |
    Then I go to the next tab

  Scenario: A MOTH user searches for a vehicle with an PRS fail MOT test and downloads the English MOT certificate
    Given I browse to /
    And I enter "CGSENFP" in the registration field
    When I press the "Continue" button

    And I click the accordion section with the id "mot-history-description"
    And I click the View test certificate link for test number "9999 9999 05"
    Then The page contains "Enter latest V5C number"

    And I enter "1231 2312 312" in the v5c certificate field for test number "9999 9999 05"
    And I press the Show test certificate button for test number "9999 9999 05"
    Then The page contains "View certificate"
    And I check the "Return to MOT test history" button is enabled

    Given I click the button with id "cert-download-link"
    When I go to the next tab
    Then PDF is embedded in the page

    When I go to the next tab
    Then I click the certificate link and check the MOT certificate PDF contains:
      | MOT test certificate                    |
      | Fail                                    |
      | Duplicate certificate issued by DVSA on |
      | Issued by DVSA                          |
      | VT30/2.0                                |
      | CGSENFP                                 |
      | 99 9999 9905                            |
    Then I go to the next tab

  Scenario: A MOTH user enters an incorrect V5C number and an appropriate error message is displayed
    Given I browse to /
    And I load "VEHICLE_REG_INVALID_CERT" as {registration}, {testnumber}, {v5c}
    And I enter {registration} in the registration field
    When I press the "Continue" button

    When I click the accordion section with the id "mot-history-description"
    Then I click the View test certificate link for test number {testnumber}
    And I wait for certificate input field for tests number {testnumber} to be visible
    Then The page contains "Enter latest V5C number"

    Given I enter "00000000000" in the v5c certificate field for test number {testnumber}
    And I press the Show test certificate button for test number {testnumber}
    And I wait for certificate input field for tests number {testnumber} to be visible
    Then The page contains "Check that the V5C number you entered is correct"

    Given I enter " " in the v5c certificate field for test number {testnumber}
    And I press the Show test certificate button for test number {testnumber}
    And I wait for certificate input field for tests number {testnumber} to be visible
    Then The page contains "Enter the V5C number"

    Given I enter "123" in the v5c certificate field for test number {testnumber}
    And I press the Show test certificate button for test number {testnumber}
    And I wait for certificate input field for tests number {testnumber} to be visible
    Then The page contains "The V5C number must be 11 numbers"

    Given I enter "123123123AB" in the v5c certificate field for test number {testnumber}
    And I press the Show test certificate button for test number {testnumber}
    And I wait for certificate input field for tests number {testnumber} to be visible
    Then The page contains "The V5C number can only contain numbers"

    Given I enter {v5c} in the v5c certificate field for test number {testnumber}
    And I press the Show test certificate button for test number {testnumber}

    Then The page contains "View certificate"
    And I check the "Return to MOT test history" button is enabled
    When I click the button with id "cert-download-link"
    And I go to the next tab
    Then The page contains "The certificate is currently unavailable"