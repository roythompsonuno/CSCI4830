package SupportAppTC;


import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;

public class EditTicket {
  private WebDriver driver;
  private boolean acceptNextAlert = true;
  private StringBuffer verificationErrors = new StringBuffer();

  @Before
  public void setUp() throws Exception {
	System.setProperty("webdriver.chrome.driver", "lib/chromedriver.exe");
    driver = new ChromeDriver();
    driver.manage().timeouts().implicitlyWait(30, TimeUnit.SECONDS);
  }

  @Test
  public void testUNOSearch() throws Exception {
	    driver.get("http://ec2-18-221-103-75.us-east-2.compute.amazonaws.com:8080/SupportApp/Index.jsp");
	    driver.findElement(By.name("userID")).click();
	    driver.findElement(By.name("userID")).clear();
	    driver.findElement(By.name("userID")).sendKeys("7");
	    Thread.sleep(200);
	    driver.findElement(By.name("password")).clear();
	    driver.findElement(By.name("password")).sendKeys("test");
	    Thread.sleep(200);
	    driver.findElement(By.name("submit")).click();
	    Thread.sleep(200);
	    driver.findElement(By.xpath("(.//*[normalize-space(text()) and normalize-space(.)='Not Assigned'])[2]/following::button[1]")).click();
	    Thread.sleep(200);
	    driver.findElement(By.name("assign")).click();
	    Thread.sleep(200);
	    new Select(driver.findElement(By.name("assign"))).selectByVisibleText("Support, Test Case");
	    Thread.sleep(200);
	    driver.findElement(By.name("assign")).click();
	    Thread.sleep(200);
	    driver.findElement(By.name("submit")).click();
		Thread.sleep(200);
      
      
	    String expected = "http://ec2-18-221-103-75.us-east-2.compute.amazonaws.com:8080/SupportApp/EditTicketE.jsp";
	    String result = driver.getCurrentUrl();
	    result = result.substring(0, result.indexOf('?'));
	    Assert.assertEquals(expected, result);
  }

  @After
  public void tearDown() throws Exception {
    driver.quit();
    String verificationErrorString = verificationErrors.toString();
    if (!"".equals(verificationErrorString)) {
      fail(verificationErrorString);
    }
  }

  private boolean isElementPresent(By by) {
    try {
      driver.findElement(by);
      return true;
    } catch (NoSuchElementException e) {
      return false;
    }
  }

  private boolean isAlertPresent() {
    try {
      driver.switchTo().alert();
      return true;
    } catch (NoAlertPresentException e) {
      return false;
    }
  }

  private String closeAlertAndGetItsText() {
    try {
      Alert alert = driver.switchTo().alert();
      String alertText = alert.getText();
      if (acceptNextAlert) {
        alert.accept();
      } else {
        alert.dismiss();
      }
      return alertText;
    } finally {
      acceptNextAlert = true;
    }
  }
}
