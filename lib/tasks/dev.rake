namespace :dev do
  desc "Setup Application DB"
  task setup: :environment do
    images_path = Rails.root.join('public', 'system')
    puts "Starting Setup..."
    puts "Drop DB... #{%x(rake db:drop)}"
    puts "Drop Images folder... #{%x(rm -rf #{images_path})}"
    puts "Create DB... #{%x(rake db:create)}"
    puts %x(rake db:migrate)
    puts %x(rake db:seed)
    puts %x(rake dev:seed)
    puts "Setup Complete."
  end
  desc "Fake data generation"
  task seed: :environment do
    puts 'Creating Fake Admins (10)...'
    10.times {
      Admin.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: '123456',
      password_confirmation: '123456',
      role: 1
    )}
    puts '10 fake admin profiles created.'
    puts 'Creating Fake Members (50)...'
    50.times {
      Member.create!(
      name: Faker::Name.name,
      email: Faker::Internet.email,
      password: '123456',
      password_confirmation: '123456'
    )}
    puts '50 fake member profiles created.'
    puts 'Creating Fake Ads (100)...'
    100.times {
      Ad.create!(
        title: Faker::Commerce.product_name,
        description: Faker::Lorem.sentence([1,2,3].sample),
        category: Category.all.sample,
        member: Member.all.sample,
        price: "#{Random.rand(500)},#{Random.rand(99)}",
        picture: File.new(Rails.root.join('public', 'templates', 'images_for_ads', "#{Random.rand(9)}.jpg"), 'r')
      )
    }
    puts '100 fake Ads created.'
  end
end
