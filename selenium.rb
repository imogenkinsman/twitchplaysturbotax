require 'selenium-webdriver'
require 'yaml'

class Driver

  @driver

  def initialize
    @driver = Selenium::WebDriver.for :chrome
    @driver.get 'https://myturbotax.intuit.com/'
  end

  def sign_in
    @driver.get 'https://myturbotax.intuit.com/'
    @driver.find_element(:name, 'Email').send_keys('twitchplaysturbotax')
    password = YAML::load(File.open('config.yml'))['ttpass']
    pass_element = @driver.find_element(:name, 'Password')
    pass_element.send_keys(password)
    pass_element.submit
  end

end
