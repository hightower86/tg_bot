require 'telegram/bot'

TOKEN = '538931357:AAFqy5MS3OA3u-1oqnC9F17MN1i0LMKQl64'

ANSWERS = [
  'Все норм',
  'Да',
  'Нет',
  'Может быть',
  'Да, конечно',
  'Ну, Попробуй',
]

def answer(message)
  if message.text == '/start'
    "Привет-привет, #{message.from.first_name}"
  else
    ANSWERS.sample
  end
end



Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    puts message 
    bot.api.send_message(
      chat_id: message.chat.id,
      text: answer(message)
      )
  end
end
 