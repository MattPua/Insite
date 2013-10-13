namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    user=User.create!(name: "Matt Pua",
                 email: "mp@utoronto.com",
                 program: "Computer Engineering",
                 password: "12345678",
                 password_confirmation: "12345678")
    array = ["AMD","Microsoft","P&G","Apple","Facebook","Google","Rotman","LinkedIn","TD Bank","Scotiabank"]
    industry_array = ["Hardware","Software","Goods","Software","Software","Software","Business","Software","Banking","Banking"]
    program_array = ["Electrical","Computer","Mineral","Industrial","Mechanical","Chemical","Materials","Civil"]
    10.times do |n|
    name = array[n]
    industry = industry_array[n]
    Company.create!(name: name,
                    industry: industry)
    end

      10.times do |n|
      name  = Faker::Name.name
      email = "#{n+1}@utoronto.com"
      password  = "12345678"
      program=" {#{program_array[n]} Engineering"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   program: program)
        2.times do |i|
        name = array[(n)]
        user_id = n+1
        company_id = n+1
        date=2.days.from_now
        position="test-#{i+1}"
        Interview.create!(company_name: name,
                          position: position,
                          user_id: user_id,
                          company_id: company_id,
                          date: date)
        end
    end


  end
end