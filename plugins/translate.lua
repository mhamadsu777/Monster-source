function translate(msg,MsgText)
local Text = msg.text
if Text == "/ar" or Text == "/fa" or Text == "/en" or Text == "/ru" or Text == "/tr" or Text == "/fr" or Text == "/it" or Text == "/ta" or Text == "/ja" or Text == "/hn" or Text == "/el" or Text == "/de" or Text == "/uk" or Text == "/ko" then
tdcli_function({ID="GetMessage",chat_id_ = msg.chat_id_,message_id_ = msg.reply_to_message_id_},function(arg,data)
local url , res = https.request('https://translate.yandex.net/api/v1/tr.json/translate?srv=android&uuid=6f4c351f-e58f-48d2-bda6-3cae1bddcbb4&id=e93642f1-1cd7-479e-9f93-08405027065b-9-0&lang='..Text:gsub('/','')..'&text='..data.content_.text_:gsub(" ",'%20'))
local get = Json.decode(url)
if get.code == 200 then
sendMsg(msg.chat_id_,msg.id_,"تمت الترجمة: من "..get.lang:gsub('-',' الى ').."\n"..get.text[0])
else
sendMsg(msg.chat_id_,msg.id_,"حدث خطاء غير متوقع وفشلت الترجمة 📛");
end
return false
end

end

return {
iMonster = translate
}
