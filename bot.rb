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

QUESTIONS = [
  'На каком языке ты написан?',
  'Кто твой автор?',
  'Сколько времени?',
  'Какой сегодня день недели?',
  'Сколько времени будет через час?',
  ]


def answer(message)
  if message.text == '/start'
    "Привет-привет, #{message.from.first_name}"
  elsif QUESTIONS.index(message.text) == 0
    'Я написан на языке RUBY'
  elsif QUESTIONS.index(message.text) == 1
    'Мой автор некий Adel'
  elsif QUESTIONS.index(message.text) == 2
    Time.now.strftime("%H:%M")
  elsif QUESTIONS.index(message.text) == 3
    if Time.now.wday == 1
      'Сегодня понедельник'
    elsif Time.now.wday == 2
      'Сегодня вторник'
    elsif Time.now.wday == 3
      'Сегодня среда'
    elsif Time.now.wday == 4
      'Сегодня четверг'
    elsif Time.now.wday == 5
      'Сегодня пятница'
    elsif Time.now.wday == 6
      'Сегодня суббота'
    elsif Time.now.wday == 7
      'Сегодня воскресенье'
    end
  elsif QUESTIONS.index(message.text) == 4
    (Time.now + 3600).strftime("%H:%M")
          
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
 