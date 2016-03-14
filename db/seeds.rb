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
