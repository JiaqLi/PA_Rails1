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

records = Array.new

json_courses = File.read("#{Rails.root}/db/course.json")
courses_obj = JSON.parse(json_courses)

courses = courses_obj.map {|r| {"name"=>r['name'], "subject_id"=>r['subjects'][0].to_h['id']}}
# courses_obj.each do |course_record|
#   course = {"name" => course_record['name'], "id" => course_record['subjects'][0].to_h['id']}
#   records.add
#   #course["name"] = course_record['name']
#   #course["id"] = course_record['subjects'][0].to_h['id']
# end

Course.create(courses)
