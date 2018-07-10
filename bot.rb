require 'telegram/bot'

TOKEN = '538931357:AAFqy5MS3OA3u-1oqnC9F17MN1i0LMKQl64'

questions = ["Переживаете ли вы в ожидании важной деловой встречи?",
  "Если вам поручат выступить с докладом на каком либо мероприятии, вызовет ли это у вас чувство дискомфорта?",
"Вы откладываете поход к врачу до последнего момента?",
"Если вам предстоит командировка в незнакомый город, постараетесь ли вы избежать этой командировки?",
"Вы делитесь своими мыслями и чувствами с кем бы то ни было?",
"Вас раздражает, когда незнакомые люди на улице обращаются к вам с вопросом?",
"Вы думаете, что людям разных поколений действительно трудно понимать друг друга?",
"Вам сложно будет сказать человеку, чтобы он вернул вам деньги, взятые у вас несколько месяцев назад?",
"Вам подали некачественное блюдо в кафе. Промолчите ли вы?",
"Вы заговорите с незнакомым человеком, оставшись с ним наедине?",
"Обнаружив в кассе, магазине, библиотеке длинную очередь, вы встанете в нее?",
"Вам неприятно быть судьей в чужих конфликтах?",
"Вы всегда оцениваете произведения искусства на свой вкус, не прислушиваясь к чужому мнению?",
"Если кто то выскажет ошибочную точку зрения на хорошо известный вам вопрос, вы предпочтете промолчать и не исправлять его?",
"Просьбы помочь в учебе или работе раздражают вас?",
"Вам проще изложить свое мнение на бумаге, чем рассказать о нем?"
]
def game
  count = 0
  for item in questions do
    puts item
    answer = 100
    until answer >= 0 && answer <= 2
      puts "Ответ: 1 - да, 0 - нет, 2 - иногда"
      answer = STDIN.gets.to_i
    end
    
    if answer == 1
      count += 2
    elsif answer == 2
      count += 1
    end
  end

  puts "Результаты теста: #{count} баллов..."

  if count >= 30 && count <= 31
  puts "Что скрывать, вы некоммуникабельны, и страдаете от этого прежде всего сами." + 
  "Но и окружающим очень трудно с вами, ведь там, где необходимы совместные усилия," + 
  "вы совершенно теряетесь. Почему вы так неохотно общаетесь? Неужели в вашем" +
   "окружении совсем нет интересных людей? Попробуйте потренировать свою" +
    "общительность — обращайтесь к людям с различными вопросами," +
     "пусть даже для начала они будут касаться только работы."
  elsif count >= 25 && count <= 29
  puts "баллов. Вы неразговорчивы, предпочитаете одиночество шумным компаниям. Друзей у вас совсем немного. Новая работа и новые люди вызывают у вас чувство дискомфорта. Эта особенность характера не ускользнула от вашего внимания, и вы часто сердитесь на себя за нее. Вспомните, как легко вы общаетесь, когда чем то очень увлечены. Ведь можете же, когда хотите."
  elsif count >= 19 && count <= 24
  puts "балла. В целом вы общительный человек. Новая обстановка и новые проблемы вас не пугают. И все таки с людьми вы сходитесь осторожно, постепенно, публично высказываетесь неохотно. Иногда ваши высказывания саркастичны, даже безо всякого на то основания.
  "
  elsif count >= 14 && count <= 18
  puts "С коммуникабельностью у вас все в порядке. Вы любознательны, терпеливы, внимательно слушаете интересного собеседника, спокойно отстаиваете свою точку зрения. Встреча с новыми людьми не вызывает у вас неприятных ощущений. Но многолюдные места, шумные компании и болтливые люди вызывают у вас раздражение.
  "
  elsif count >= 9 && count <= 13
  puts "Вы весьма общительны, не так ли? Ваши любопытство, разговорчивость, вспыльчивость вызывают у некоторых людей раздражение и заставляют думать о вас как о легкомысленном человеке. Вы легко знакомитесь с новыми людьми, вам нравятся большие компании, особенно если вы находитесь в центре всеобщего внимания. Вам не помешает выработать в себе немного терпения и усидчивости, необходимых для решения серьезных проблем.
  "
  elsif count >= 4 && count <= 8
  puts "Вы, кажется, знакомы со всеми и все всегда обо всех знаете. Вы любите принимать участие в различных обсуждениях, хотя серьезные темы кажутся вам ужасно скучными. Привыкли высказываться даже в том случае, если недостаточно компетентны в обсуждаемом вопросе. Беретесь за любое дело, хотя не всегда можете успешно довести его до конца. Неудивительно, что руководители и коллеги относятся к вам с недоверием и никто не хочет выполнять с вами совместные задания."
  elsif count <= 3
  puts "Ваша общительность чрезмерна. Вы говорливы, многословны, вспыльчивы, обидчивы, часто необъективны. Вы вмешиваетесь в дела, которые не имеют к вам никакого отношения. Беретесь судить о проблемах, в которых совершенно не разбираетесь. Часто из за вас возникают конфликты. С серьезной работой вы справиться не в состоянии. Людям очень трудно с вами. Вам необходимо воспитывать в себе терпение, сдержанность и уважительное отношение к людям."
  end
end


def answer(message)
  if message == '/start'
    "Привет-привет, #{message.from.first_name}"
    "Сыграем в игру..."
  else
    "... набери ..."
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
 