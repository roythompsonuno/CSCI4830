package SupportAppTC;


import java.util.concurrent.TimeUnit;
import org.junit.*;
import static org.junit.Assert.*;
import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;

public class CreateTicket {
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
      driver.findElement(By.name("userID")).sendKeys("6");
      Thread.sleep(200);
      driver.findElement(By.name("password")).clear();
      driver.findElement(By.name("password")).sendKeys("test");
      Thread.sleep(200);
      driver.findElement(By.name("submit")).click();
      Thread.sleep(200);
      driver.findElement(By.linkText("Create Ticket")).click();
      Thread.sleep(200);
      driver.findElement(By.name("description")).click();
      driver.findElement(By.name("description")).clear();
      driver.findElement(By.name("description")).sendKeys("Testing");
      Thread.sleep(200);
      driver.findElement(By.name("submit")).click();
      Thread.sleep(200);
      
      
      String expected = "http://ec2-18-221-103-75.us-east-2.compute.amazonaws.com:8080/SupportApp/ViewTicketE.jsp";
      String result = driver.getCurrentUrl();
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
