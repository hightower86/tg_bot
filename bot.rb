require 'telegram/bot'

TOKEN = '538931357:AAFqy5MS3OA3u-1oqnC9F17MN1i0LMKQl64'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    puts message 
    bot.api.send_message(
      chat_id: message.chat.id,
      text: "Привет #{message.from.first_name}"
      )
  end
end
 