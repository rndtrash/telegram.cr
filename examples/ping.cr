require "../src/telegram.cr"

bot = Telegram::Client.new(token: "yourtoken")

bot.on_message_create do |message|
  if (message.not_nil!.text.starts_with? "/ping")
    bot.sendMessage(message.not_nil!.chat.id, "Pong!")
  end
end

bot.run
