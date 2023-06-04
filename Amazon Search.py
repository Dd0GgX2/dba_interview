from selenium.webdriver.common.by import By

print("Please enter search string")
keyword = input()

search_box = driver.find_element(By.ID, 'twotabsearchtextbox')

search_box.send_keys(keyword)

search_button = driver.find_element(By.ID, 'nav-search-submit-button')

search_button.click()

driver.implicitly_wait(5)

driver.quit()