# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

5.times do
  password = Faker::Lorem.characters(10)
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: password,
    password_confirmation: password)
  user.skip_confirmation!
  user.save

  5.times do
    post = Post.create(
      user: user,
      title: Faker::Lorem.sentence,
      body: Faker::Lorem.paragraph)
    post.update_attribute(:created_at, Time.now - rand(600..31536000))

    # 3.times do
    #   p.comments.create(body: Faker::Lorem.paragraph)
    # end

  end
end

user = User.first
user.skip_reconfirmation!
user.update_attributes(email: 'subskriptions@gmail.com', password: '*mbPm4XEvv4gWtF', password_confirmation: '*mbPm4XEvv4gWtF')

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
