# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Home.create(name: 'Home', address_one: '6', address_two: 'Hurst Avenue', city: 'London', postcode: 'E4 8DW', home_key: '1')
Home.create(name: 'House two', address_one: '118', address_two: 'Erskine Road', city: 'London', postcode: 'E17 6SA', home_key: '2')
Home.create(name: 'House three', address_one: '10', address_two: 'Downing Street', city: 'London', postcode: 'SW1A 2AA', home_key: '3')
Home.create(name: 'House four', address_one: 'Buckingham Palace', address_two: 'Spur Road', city: 'London', postcode: 'SW1A 1AA ', home_key: '4')


User.create(email:'vlad.georgiev@outlook.com', password:'1', first_name: 'Vlad', last_name: 'Georgiev', home_id: 1)
User.create(email:'dilyana.georgieva85@gmail.com', password:'123', first_name: 'Didi', last_name: 'Georgieva', home_id: 1)
User.create(email:'nicole.georgieva@outlook.com', password:'123', first_name: 'Nicole', last_name: 'Georgieva', home_id: 1)
User.create(email:'alexander.georgiev@outlook.com', password:'123', first_name: 'Alex', last_name: 'Georgiev', home_id: 1)

User.create(email:'mirela.sabeva@outlook.com', password:'123', first_name: 'Mirela', last_name: 'Sabeva', home_id: 2)
User.create(email:'nikolai.sabev@outlook.com', password:'123', first_name: 'Nikolai', last_name: 'Sabev', home_id: 2)

User.create(email:'a@a.com', password:'123', first_name: 'Ada', last_name: 'Ada', home_id: 3)
User.create(email:'b@b.com', password:'123', first_name: 'Bob', last_name: 'Bob', home_id: 3)
User.create(email:'c@c.com', password:'123', first_name: 'Catherine', last_name: 'Catherine', home_id: 3)

User.create(email:'d@d.com', password:'123', first_name: 'Dan', last_name: 'Dan', home_id: 4)
User.create(email:'e@e.com', password:'123', first_name: 'Elizabeth', last_name: 'Elizabeth', home_id: 4)
User.create(email:'f@f.com', password:'123', first_name: 'Felix', last_name: 'Felix', home_id: 4)


Bill.create(name: 'Rent', total: 2100, date_due: '2019/08/28', home_id: 1)
Bill.create(name: 'Gas', total: 89.55, date_due: '2019/08/25', home_id: 1)
Bill.create(name: 'Electricity', total: 110.50, date_due: '2019/08/25', home_id: 1)
Bill.create(name: 'Water', total: 30.20, date_due: '2019/08/14', home_id: 1)

Bill.create(name: 'Rent', total: 1850, date_due: '2019/08/30', home_id: 2)
Bill.create(name: 'Gas', total: 35.90, date_due: '2019/08/30', home_id: 2)
Bill.create(name: 'Electricity', total: 55.31, date_due: '2019/08/30', home_id: 2)
Bill.create(name: 'Water', total: 22.56, date_due: '2019/08/30', home_id: 2)

Bill.create(name: 'Rent', total: 8730, date_due: '2019/08/15', home_id: 3)
Bill.create(name: 'Gas', total: 280.65, date_due: '2019/08/25', home_id: 3)
Bill.create(name: 'Electricity', total: 330.67, date_due: '2019/08/05', home_id: 3)
Bill.create(name: 'Water', total: 103.89, date_due: '2019/08/16', home_id: 3)

Bill.create(name: 'Rent', total: 1200, date_due: '2019/08/20', home_id: 4)
Bill.create(name: 'Gas', total: 30.90, date_due: '2019/08/23', home_id: 4)
Bill.create(name: 'Electricity', total: 35.94, date_due: '2019/08/18', home_id: 4)
Bill.create(name: 'Water', total: 25.90, date_due: '2019/08/29', home_id: 4)


BillSplit.create(paid: false, amount: 525, bill_id: 1, user_id: 1)
BillSplit.create(paid: true, amount: 22.38, bill_id: 2, user_id: 1)
BillSplit.create(paid: false, amount: 27.63, bill_id: 3, user_id: 1)
BillSplit.create(paid: false, amount: 7.55, bill_id: 4, user_id: 1)

BillSplit.create(paid: false, amount: 525, bill_id: 1, user_id: 2)
BillSplit.create(paid: true, amount: 22.38, bill_id: 2, user_id: 2)
BillSplit.create(paid: false, amount: 27.63, bill_id: 3, user_id: 2)
BillSplit.create(paid: false, amount: 7.55, bill_id: 4, user_id: 2)

BillSplit.create(paid: false, amount: 525, bill_id: 1, user_id: 3)
BillSplit.create(paid: true, amount: 22.38, bill_id: 2, user_id: 3)
BillSplit.create(paid: false, amount: 27.63, bill_id: 3, user_id: 3)
BillSplit.create(paid: false, amount: 7.55, bill_id: 4, user_id: 3)

BillSplit.create(paid: false, amount: 525, bill_id: 1, user_id: 4)
BillSplit.create(paid: true, amount: 22.38, bill_id: 2, user_id: 4)
BillSplit.create(paid: false, amount: 27.63, bill_id: 3, user_id: 4)
BillSplit.create(paid: false, amount: 7.55, bill_id: 4, user_id: 4)


Task.create(name: 'Laundry', description: 'Do the laundry', date_due: '2019/08/12', completed: false, home_id: 1, user_id: 1)
Task.create(name: 'Hoover', description: 'Hoover the communal areas', date_due: '2019/08/07', completed: true, home_id: 1, user_id: 1)
Task.create(name: 'Pets', description: 'Feed the pets', date_due: '2019/08/12', completed: true, home_id: 1, user_id:2)
Task.create(name: 'Bins', description: 'Take out the rubbish', date_due: '2019/08/12', completed: false, home_id: 1, user_id:2)


Essential.create(name: 'Toilet roll', more: false, home_id: 1)
Essential.create(name: 'Washing up liquid', more: true, home_id: 1)
Essential.create(name: 'Soap', more: false, home_id: 1)
Essential.create(name: 'Bin bags', more: false, home_id: 1)
Essential.create(name: 'Sponges', more: true, home_id: 1)
Essential.create(name: 'Napkins', more: false, home_id: 1)