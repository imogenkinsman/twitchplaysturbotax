require 'cinch'
require 'yaml'

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
end

bot.start
