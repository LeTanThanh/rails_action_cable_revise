User.create name: "LeTanThanh",
  email: "le.tan.thanh@sun-asterisk.com",
  password: "12345678",
  password_confirmation: "12345678"

10.times do
  name = FFaker::Name.unique.name
  email = name.split(" ").each(&:downcase).join("_") + "@sun-asterisk.com"

  User.create name: name, email: email,
    password: "12345678", password_confirmation: "12345678"
end

User.all.to_a.sample(5).each do |user|
  chat_room = user.chat_rooms.create name: FFaker::Lorem.phrase

  3.times do
    User.all.to_a.sample(5).each do |user|
      user.messages.create content: FFaker::Lorem.phrase, chat_room: chat_room
    end
  end
end
