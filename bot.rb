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

  on :message, /^(.)$/ do |m, char|
    m.reply "You just typed #{char}!"
  end

  on :message, /^!boot$/ do |m|
    @driver ||= Driver.new
  end

  on :message, /^!login$/ do |m|
    @driver.sign_in
  end

  # on :message, '!help' do |m|
    # m.reply ""
  # end
end

bot.start
