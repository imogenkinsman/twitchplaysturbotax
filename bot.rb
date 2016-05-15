require 'cinch'
require 'yaml'
require './driver'

bot = Cinch::Bot.new do

  configure do |c|
    c.server = 'irc.chat.twitch.tv'
    c.nick = 'twitchplaysturbotax'
    c.password = YAML::load(File.open('config.yml'))['token']
    c.channels = ['#twitchplaysturbotax']
  end

  on :message, /^boot$/ do |m|
    @driver ||= Driver.new
  end

  on :message, /^login$/ do |m|
    @driver.sign_in
  end

  on :message, /^button (.*)$/ do |m, button|
    @driver.click_button(button)
  end

  on :message, /^link (.*)$/ do |m, link|
    @driver.click_link(link)
  end

  on :message, /^check (.*)$/ do |m, checkbox|
    @driver.check(checkbox)
  end

  on :message, /^uncheck (.*)$/ do |m, checkbox|
    @driver.uncheck(checkbox)
  end

  on :message, /^choose (.*)$/ do |m, radio|
    @driver.choose(radio)
  end

  on :message, /^fill (.*):(.*)$/ do |m, form, text|
    @driver.fill_in(form, text)
  end
end

bot.start
