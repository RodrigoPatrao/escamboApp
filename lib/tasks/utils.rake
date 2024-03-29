namespace :utils do
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
