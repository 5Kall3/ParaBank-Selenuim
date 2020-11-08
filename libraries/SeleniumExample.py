from robot.libraries.BuiltIn import BuiltIn
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions


class SeleniumExample:
    """
    after the WebDriverWait function you can add commands such as
    click()
    enabled()
    more information here https://selenium-python.readthedocs.io/waits.html
    """

    library = "SeleniumLibrary"

    def __get_library(self, lib):
        """
        Returns the library instance. It is required in order to instantiate
        a driver object (library.webdriver.browser).
        """
        return BuiltIn().get_library_instance(lib)

    def python_is_displayed(self, locator):
        driver = self.__get_library(self.library).driver
        WebDriverWait(driver, 60).until(expected_conditions.presence_of_element_located((
            By.XPATH, locator))).is_displayed()

    def python_click(self, locator):
        driver = self.__get_library(self.library).driver
        WebDriverWait(driver, 60).until(expected_conditions.presence_of_element_located((
            By.XPATH, locator))).click()

    def python_input_text(self, locator, text):
        driver = self.__get_library(self.library).driver
        WebDriverWait(driver, 60).until(expected_conditions.presence_of_element_located((
            By.XPATH, locator))).send_keys(text)