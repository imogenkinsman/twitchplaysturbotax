require 'yaml'
require 'capybara'
require 'capybara/dsl'

Capybara.app_host = 'https://myturbotax.intuit.com'
Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end
Capybara.default_driver = :selenium

class Driver
  include Capybara::DSL

  def initialize
    visit '/'
  end

  def sign_in
    visit '/'
    config = YAML::load(File.open('config.yml'))
    fill_in('Email', with: config['ttuser'])
    password = config['ttpass']
    fill_in('Password', with: config['ttpass'])
    click_button 'Sign In'
    click_button 'Skip for now'
  end

  def click_button(text)
    click_button(text)
  end

  def click_link(link)
    click_link(link)
  end

  def check(checkbox)
    check(checkbox)
  end

  def uncheck(checkbox)
    uncheck(checkbox)
  end

  def choose(radio)
    choose(radio)
  end

  def fill_in(form, text)
    fill_in(form, with: text)
  end
end
