# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(
  name: "I'm a teacher",
  email: "example@example.com",
  password: "teacher",
  password_confirmation: "teacher",
  teacher_id: 1
)

2.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "1234",
    password_confirmation: "1234",
    teacher_id: 1)
end

User.create(
  name: "Sebastian Teacher",
  email: "sebastian@teacher.com",
  password: "1234",
  password_confirmation: "1234",
  teacher_id: 1
)

User.create(
  name: "Sebastian Student",
  email:"sebastian@student.com",
  password: "1234",
  password_confirmation: "1234",
  teacher_id: 4
)

5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "teacher1",
    password_confirmation: "teacher1",
    teacher_id: 4)
end

5.times do
  User.create(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: "teacher2",
    password_confirmation: "teacher2",
    teacher_id: 3
  )
end

Assignment.create(
  title: 'Homework Tracker',
  description: %&* Create an application to track homework assignments.
* This application should have users, assignments, and completed assignments (turn-ins? This needs a decent name.)
* An assignment has a title, description, assigned date, and due date. All of the above are required. The description is in Markdown and should render correctly.
* Each user can complete each assignment, making a record of that completion.
* Users have to be able to log in. You can make a simple login or use another gem if you think thats a good idea.
* Each person has a page that shows their assignments and whether or not theyve completed each one.
* Past due assignments are visually highlighted.
* Assignments are not shown before their assigned date on each users page.
* Completed assignments should have a text box to paste in their work or a URL that points to their work.
* Bonus: Completed assignments can have comments on them.
* Bonus: Use a before_action method to prevent people from seeing homework before its assigned date.
* Bonus: Make teacher and student accounts. Teachers do not have to do homework; students cannot create homework. Teachers can see a list of all homework assigned and each persons completions.&,
  date: DateTime.now,
  due: DateTime.tomorrow
)

5.times do |i|
  Assignment.create(
    title: Faker::Company.name,
    description: "###" + Faker::Company.catch_phrase + Faker::Lorem.paragraph,
    date: DateTime.now + (i - 3).days,
    due: DateTime.tomorrow + (i - 3).days
  )
end


CompletedAssignment.create(
  user_id: 5,
  assignments_id: 1,
  url: "https://github.com/sebarmano/tracker",
  completed: true
)

CompletedAssignment.create(
  user_id: 5,
  assignments_id: 3,
  url: "https://github.com/sebarmano/tracker",
  completed: false
)
