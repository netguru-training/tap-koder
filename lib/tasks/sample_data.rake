namespace :db do
  desc "Fill database with simple data"
  task populate: :environment do
    make_users
    make_content
  end
end

def make_users
  admin = User.create!(name: "Example",
                                   email: "example@example.org",
                                   password: "alamakota",
                                   password_confirmation: "alamakota",
                                   admin: true)
  5.times do |n|
    name  = Faker::Company.name
    email = "example-#{n+1}@example.org"
    User.create!(name: name,
                        email: email,
                        password: "alamakota",
                        password_confirmation: "alamakota")
  end
end

def make_content
  users = User.all
  users.each do |user|
    5.times do
      name = Faker::Commerce.product_name
      description = Faker::Lorem.sentence
      code_limit = rand(1..5)
      date = rand(1..30).days.from_now
      offer = user.offers.create!(name: name, description: description,
                                             code_limit: code_limit, start_date: date)
    end
  end
end
