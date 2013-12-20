namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do


    password = "password"

    User.populate 6 do |user|
      user.username = Faker::Name.name
      user.email = Faker::Internet.email
      user.encrypted_password = User.new(:password => password).encrypted_password
      user.sign_in_count = 0
    end

    users = User.all(limit: 6)
    50.times do
      content = Faker::Lorem.sentence(5)
      users.each { |user| user.microposts.create!(content: content) }
    end
  end
end
