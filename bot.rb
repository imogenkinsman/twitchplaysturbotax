require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'irc.pixie.life'
    c.nick = 'TurboBot'
    c.channels = ['#jade']
  end

  on :message, /^(.)$/ do |m, char|
    m.reply "You just typed #{char}!"
  end
end

bot.start
