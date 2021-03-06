package uk.gov.dvsa.mot.fixtures.moth;

import static junit.framework.TestCase.assertTrue;

import cucumber.api.java8.En;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import uk.gov.dvsa.mot.framework.WebDriverWrapper;

import javax.inject.Inject;


public class MothStepDefintions implements En {

    /** The logger to use. */
    private static final Logger logger = LoggerFactory.getLogger(MothStepDefintions.class);

    /** The driverwrapper to use. */
    private final WebDriverWrapper driverWrapper;

    /**
     * Create a new instance.
     * @param driverWrapper The web driver wrapper to be used
     */
    @Inject
    public MothStepDefintions(WebDriverWrapper driverWrapper) {
        this.driverWrapper = driverWrapper;

        When("^I enter \"([^\"]+)\" in the registration field$", (String text) ->
                driverWrapper.enterIntoFieldWithLabel(" Registration number (number plate) ", text));

        When("^I enter \\{([^\\}]+)\\} in the registration field$", (String dataKey) ->
                driverWrapper.enterIntoFieldWithLabel(" Registration number (number plate) ",
                        driverWrapper.getData(dataKey)));

        When("^I enter \\{([^\\}]+)\\} in the hidden registration field$", (String dataKey) ->
                driverWrapper.enterIntoHiddenFieldWithLabel("Do not enter any",
                        "Do not fill this field", driverWrapper.getData(dataKey)));

        When("^I click the last \"([^\"]+)\" text$", (String linkText) ->
                driverWrapper.clickLastText(linkText));

        When("^I click the first \"([^\"]+)\" text$", (String linkText) ->
                driverWrapper.clickFirstText(linkText));

        When("^I go to the next tab$", () -> driverWrapper.goNextTab());

        When("^I close extra tabs$", () -> driverWrapper.closeTabs());

        When("^PDF is embedded in the page$", () -> assertTrue(driverWrapper.containsEmbeddedPdf()));

        And("^I click the View test certificate link for test number \"([^\"]+)\"$", (String testno) ->
                driverWrapper.clickTestnumberText(testno));

        And("^I enter \"([^\"]+)\" in the v5c certificate field for test number \"([^\"]+)\"$",
                (String text, String testno) -> driverWrapper.enterV5cTestnumber(text, testno));

        And("^I press the Show test certificate button for test number \"([^\"]+)\"$",
                (String testno) -> driverWrapper.pressButtonnumberText(testno));

        And("^I enter \"([^\"]+)\" in the v5c certificate field for test number \\{([^\\}]+)\\}$",
                (String text, String testno) -> driverWrapper.enterV5cTestnumber(text, driverWrapper.getData(testno)));

        And("^I click the View test certificate link for test number \\{([^\\}]+)\\}$", (String testno) ->
                driverWrapper.clickTestnumberText(driverWrapper.getData(testno)));

        And("^I enter \\{([^\\}]+)\\} in the v5c certificate field for test number \\{([^\\}]+)\\}$",
                (String text, String testno) ->
                        driverWrapper.enterV5cTestnumber(driverWrapper.getData(text), driverWrapper.getData(testno)));

        And("^I press the Show test certificate button for test number \\{([^\\}]+)\\}$",
                (String testno) -> driverWrapper.pressButtonnumberText(driverWrapper.getData(testno)));

        And("^I wait for certificate input field for tests number \\{([^\\}]+)\\} to be visible$",
                (String testno) -> driverWrapper.waitForElementVisibleById(driverWrapper.getData(testno)));

        And("^I click the accordion section with the id \"([^\"]+)\"$", (String accordionId) ->
                driverWrapper.accordionClick(accordionId));

        When("^I click the \"([^\"]+)\" help link$", (String helpText) ->
                driverWrapper.helptextClick(helpText));
    }

}