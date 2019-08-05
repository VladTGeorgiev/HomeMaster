# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Home.create(name: 'House one', address_one: '6', address_two: 'Hurst Avenue', city: 'London', postcode: 'E4 8DW', home_key: '1')
Home.create(name: 'House two', address_one: '118', address_two: 'Erskine Road', city: 'London', postcode: 'E17 6SA', home_key: '2')


User.create(email:'vlad.georgiev@outlook.com',password:'1', first_name: 'Vlad', last_name: 'Georgiev', home_id: 1)
User.create(email:'dilyana.georgieva85@gmail.com',password:'1', first_name: 'Didi', last_name: 'Georgieva', home_id: 1)
User.create(email:'nicole.georgieva@outlook.com',password:'1', first_name: 'Nicole', last_name: 'Georgieva', home_id: 1)
User.create(email:'alexander.georgiev@outlook.com',password:'1', first_name: 'Alex', last_name: 'Georgiev', home_id: 1)

User.create(email:'mirela.sabeva@outlook.com',password:'1', first_name: 'Mirela', last_name: 'Sabeva', home_id: 2)
User.create(email:'nikolai.sabev@outlook.com',password:'1', first_name: 'Nikolai', last_name: 'Sabev', home_id: 2)

