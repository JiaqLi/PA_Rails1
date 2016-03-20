# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'

Course.delete_all
Instructor.delete_all
Subject.delete_all
User.delete_all
Enrollment.delete_all

json_courses = File.read("#{Rails.root}/db/course.json")
courses_obj = JSON.parse(json_courses)
courses = courses_obj.map {|r| {"name"=>r['name'], "subject_id"=>r['subjects'][0].to_h['id']}}

json_instructors = File.read("#{Rails.root}/db/instructor.json")
instructors_obj = JSON.parse(json_instructors)
instructors = instructors_obj.map {|r| {"name"=>(r['first']+ " " +r['last'])}}

json_subjects = File.read("#{Rails.root}/db/subject.json")
subjects_obj = JSON.parse(json_subjects)
subjects = subjects_obj.map {|r| {"name"=>r['name']}}

Course.create(courses)
Instructor.create(instructors)
Subject.create(subjects)

100.times do
  User.create(name: Faker::Name.name,
    #b_day: Faker::Date.birthday(min_age = 10, max_age = 30),
    #f_book: "true", default_loc: Faker::Address.city,
    email: Faker::Internet.email, encrypted_password: Faker::Number.number(6),
    confirmation_token: Faker::Number.number(3), remember_token: Faker::Number.number(3))  
end

20.times do
  Enrollment.create(user: User.all.sample, course: Course.all.sample)
end
