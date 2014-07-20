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
    2.times do
      name = Faker::Commerce.product_name
      description = Faker::Lorem.sentence
      code_limit = rand(1..5)
      date_in_future = rand(1..30).days.from_now
      date_in_past = rand(1..30).days.ago
      offerpending = user.offers.create!(name: name, description: description,
                                                          code_limit: code_limit, start_date: date_in_future )
      offeractive = Offer.new(name: name, description: description,
                                          code_limit: code_limit, start_date: date_in_past, user_id: user)
      offeractive.save!(validate: false)
    end
  end
end
