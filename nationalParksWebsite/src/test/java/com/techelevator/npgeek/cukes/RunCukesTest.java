package com.techelevator.npgeek.cukes;


import org.junit.BeforeClass;
import org.junit.runner.RunWith;

import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
public class RunCukesTest {

	@BeforeClass
	public static void initChromeDriver() {
		/* The webdriver.chrome.driver property is used by the ChromeDriver
		 * when it is created. We set that property here so that it is available
		 * when the driver is instantiated by Spring */
		String homeDir = System.getProperty("user.home");
		System.setProperty("webdriver.chrome.driver", homeDir+"/dev-tools/chromedriver/chromedriver");
	}
}
