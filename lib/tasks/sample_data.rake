namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(name: "Matt Pua",
                 email: "mattpua49@gmail.com",
                 password: "12345678",
                 password_confirmation: "12345678")
      array = ["AMD","Microsoft","P&G","Apple","Facebook","Google","Rotman","LinkedIn","TD Bank","Scotiabank"]
      10.times do |n|
      name = array[n]
      industry = "test-#{n+1}"
      Company.create!(name: name,
                      industry: industry)
      end
      10.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password12"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
        2.times do |i|
        name = Faker::Name.name
        user_id = n
        position="test-#{i+1}"
        Interview.create!(company_name: name,
                          position: position,
                          user_id: user_id)
        end
    end


  end
end