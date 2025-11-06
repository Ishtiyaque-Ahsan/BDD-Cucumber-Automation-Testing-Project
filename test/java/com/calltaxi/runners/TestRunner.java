package com.calltaxi.runners;

import org.junit.runner.RunWith;
import io.cucumber.junit.Cucumber;
import io.cucumber.junit.CucumberOptions;

@RunWith(Cucumber.class)
@CucumberOptions(
    features = ".\\src\\test\\java\\com\\calltaxi\\features",
    glue = {"com.calltaxi.stepdefinitions", "com.calltaxi.hooks"},
    plugin = {"pretty", 
              "html:target/CucumberReport.html", 
              "json:target/cucumber.json"},
    //tags="@exceldata",
    monochrome = true
)
public class TestRunner {
}

