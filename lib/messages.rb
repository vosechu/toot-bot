message :exact => "%help" do |message, params|
  msg = "%help: This message
%quit: Quit the bot immediately
%deploytrain: Display a message about deploy happening now
%deploytrain [n]: Display a message about a deploy happening in n minutes"
  post msg, message.user
end

message :exact => "%deploytrain" do |message, params|
  post "@all: Yay! The deploy train is leaving the station! TOOT TOOT!"
end
message "%deploytrain :time" do |message, params|
  post "@all: The deploy train is leaving in #{params[:time]} minutes"
end

message :exact => "%quit" do |message, params|
  post "Bye Bye!"
  close
end

message '\ long' do |message, params|
  post "That's what she said!"
end

message /^%imp (.*)/ do |message, params|
  post params[0]
end

# Log every single line
# (you can use "message :all" too ;)
# message do |message, params|
#   puts message
#   puts message.user
# end
# # Respond with whatever was given as the answer.
# message ".answer :me" do |message, params|
#   post "ok, the answer is: #{params[:me]}"
# end
# 
# ## You need a extern Google engine
# ## write your own or search github.com
# message /\A!google (.+)/im do |message, params|
#   search_result = MyGoogleSearch.lookup(params.first)
#   post "Google Search for '#{params.first}':\n#{search_result}"
# end
# 
# leave do |message, params|
#   post "and there he goes...good bye, #{message.user}"
# end
# 
# join do |message, params|
#   post "Hi, #{message.user}. How are you?"
# end