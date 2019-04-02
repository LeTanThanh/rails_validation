10.times do
  User.create! name: FFaker::Name.name, terms_of_service: true,
    password: "123456", password_confirmation: "123456",
    subdomain: "vn"
end
