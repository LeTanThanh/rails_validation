10.times do
  User.create! name: FFaker::Name.name, terms_of_service: true
end
