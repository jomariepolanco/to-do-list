# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Team.destroy_all
User.destroy_all
List.destroy_all
Task.destroy_all

5.times do
    Team.create!(name: Faker::Company.name)
end

20.times do 
    User.create!(name: Faker::Name.first_name, team_id: Team.all.sample.id)
end

10.times do 
    List.create!(category: Faker::Company.industry, complete: false)
end

50.times do 
    Task.create!(content: Faker::Music::Prince.lyric, complete: false, user_id: User.all.sample.id , list_id: List.all.sample.id )
end