package com.calltaxi.runners;

import io.cucumber.testng.AbstractTestNGCucumberTests;
import io.cucumber.testng.CucumberOptions;


@CucumberOptions(
    features = "src/test/java/com/calltaxi/features",
    glue = {"com.calltaxi.stepdefinitions", "com.calltaxi.hooks"},
    plugin = {"pretty", 
              "html:target/CucumberReport.html", 
              "json:target/cucumber.json"},
    tags="@exceldata or @success or @errordetected or @knownbug or @nav",
    //tags="@knownbug",
    monochrome = true
)
public class TestRunner1 extends AbstractTestNGCucumberTests{

}

