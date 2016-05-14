require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = 'irc.pixie.life'
    c.nick = 'TurboBot'
    c.channels = ['#jade']
  end

  on :message, 'hello' do |m|
    m.reply 'Omghi :D'
  end
end

bot.start
