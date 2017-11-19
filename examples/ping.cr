require "file"
require "../src/telegram.cr"

token_file = JSON.parse(File.read("../token.json").to_s)
token = token_file["token"].as_s
bot = Telegram::Client.new(token: token)

bot.on_message_create do |message|
  if (message.text.not_nil!.starts_with? "/ping")
    bot.sendMessage(message.chat.id, "Pong!")
  end
end

bot.on_message_edit do |message|
  bot.sendMessage(message.chat.id, message.text.not_nil!)
end

bot.run
