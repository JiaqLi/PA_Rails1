# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'

json_courses = File.read('/home/jiaqi/Downloads/course.json')
courses_obj = JSON.parse(json_courses)

courses_obj.each do |course_record|
  course_name = course_record['name']
  course_id = course_record['subjects'][0].to_h['id']
  #why there are multiple ids for one course?????
  Course.create(name: course_name, subject_id: course_id)
  #subject_id: course_record['subjects'][1]['id'])
  #puts course_record['subjects'].size
  #puts course_record['subjects'][1]
  #puts "---------"
  #puts course_record['subjects'][0].to_h['id']
end
