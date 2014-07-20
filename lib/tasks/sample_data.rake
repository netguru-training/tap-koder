namespace :db do
  desc "Fill database with simple data"
  task populate: :environment do
    make_users
  end
end

def make_users
  admin = User.create!(firstname: "Example",
                                   lastname: "User",
                                   email: "example@example.org",
                                   password: "alamakota",
                                   password_confirmation: "alamakota",
                                   admin: true)
  5.times do |n|
    firstname  = Faker::Name.first_name
    lastname = Faker::Name.last_name
    email = "example-#{n+1}@example.org"
    User.create!(firstname: firstname,
                        lastname: lastname,
                        email: email,
                        password: "alamakota",
                        password_confirmation: "alamakota")
  end
end
