local function run(msg, matches)
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['antitag'] then
                lock_tag = data[tostring(msg.to.id)]['settings']['antitag']
            end
        end
    end
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if lock_tag == "yes" then
        send_large_msg(chat, 'به دلیل موارد امنیتی از گروه سیتکیر میشوید\nبای')
        chat_del_user(chat, user, ok_cb, true)
    end
end
 
return {
  patterns = {
    "#(.*)",
    "xy(.*)",
    "yx(.*)",
    "XY(.*)",
    "Xy(.*)",
    "ایکس ایگرگ(.*)",
    "ایگرگ(.*)",
    "ایکس(.*)",
    "/start(.*)",
    "z(.*)"
  },
  run = run
}
