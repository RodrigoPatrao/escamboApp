# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts 'Seeding categories...'
# 30.times { Category.find_or_create_by(description: Faker::Commerce.product_name) }
['Animais e Acessórios', 'Esportes', 'Para a sua Casa', 'Eletrônicos e Celulares',
  'Música e Hobbies', 'Bebês e Crianças', 'Moda e Beleza', 'Veículos e Barcos',
  'Imóveis', 'Empregos e Negócios'].each do |c|
    Category.find_or_create_by(description: c)
end
puts 'Categories seeded.'
puts 'Creating default Admin...'
Admin.create!(
  name: 'Administrador Geral',
  email: 'admin@admin.com',
  password: '123456',
  password_confirmation: '123456',
  role: 0
)
puts 'Default Admin created.'
puts 'Creating default Member...'
Member.create!(
  name: 'Praxedes',
  email: 'member@member.com',
  password: '123456',
  password_confirmation: '123456'
)
puts 'Default Member created.'
