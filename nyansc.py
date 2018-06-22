# coding: UTF-8
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as ec
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.action_chains import ActionChains

import sys
args = sys.argv

url = args[1]

log_name = "/Users/yuuis/work_rails/nyansta/tmp/phantomjs_log.txt"
phantomjs_options = ["--ignore-ssl-errors=true", "--ssl-protocol=any"]

# user agent
user_agent = "Mozilla/5.0 (Windows NT 5.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36"
dcap = {
    "phantomjs.page.settings.userAgent" : user_agent,
    "marionette" : True
}

driver = webdriver.PhantomJS(service_log_path=log_name, desired_capabilities=dcap)
driver.set_window_size(1024, 768)


try:
    driver.get(url)

    file = open("/Users/yuuis/work_rails/nyansta/tmp/nyantemp.txt", "w")
    file.write(driver.page_source.encode('utf-8'))
    file.close()
    driver.close()
except:
    driver.close()