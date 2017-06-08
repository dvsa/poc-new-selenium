package uk.gov.dvsa.mot.fixtures;

import cucumber.api.java8.En;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.test.context.ContextConfiguration;
import uk.gov.dvsa.mot.di.SpringConfiguration;
import uk.gov.dvsa.mot.framework.WebDriverWrapper;

import javax.inject.Inject;

import static junit.framework.TestCase.assertTrue;

/**
 * Step definitions for web test steps.
 */
@ContextConfiguration(classes=SpringConfiguration.class)
public class WebStepDefinitions implements En {

    /** The logger to use. */
    private static final Logger logger = LoggerFactory.getLogger(WebStepDefinitions.class);

    /** The driver wrapper to use. */
    private final WebDriverWrapper driverWrapper;

    @Inject
    public WebStepDefinitions(WebDriverWrapper driverWrapper) {
        logger.debug("Creating WebStepDefinitions...");
        this.driverWrapper = driverWrapper;

        Given("^I login with 2FA as username (\\w+)$", (String username) -> {
            driverWrapper.loginWith2FA(username);
        });

        When("^I browse to (\\S+)$", (String relativePath) -> {
            driverWrapper.browseTo(relativePath);
        });

        When("^I press the \"([^\"]*)\" button$", (String buttonText) -> {
            driverWrapper.pressButton(buttonText);
        });

        When("^I click the \"([^\"]*)\" link$", (String linkText) -> {
            driverWrapper.clickLink(linkText);
        });

        When("^I enter \"([^\"]*)\" in the \"([^\"]*)\" field$", (String text, String label) -> {
            driverWrapper.enterIntoField(text, label);
        });

        Then("^The page title contains (.*+)$", (String title) -> {
            logger.debug("Looking for page title {}", title);
            assertTrue("Wrong page title", driverWrapper.getCurrentPageTitle().contains(title));
        });

    }
}
