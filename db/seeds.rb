10.times do
  name = FFaker::Name.name
  email = name.split(" ").map(&:downcase).join("_") + "@sun-asterisk.com"
  User.create! name: name, email: email, terms_of_service: true,
    password: "123456", password_confirmation: "123456",
    subdomain: "vn"
end
