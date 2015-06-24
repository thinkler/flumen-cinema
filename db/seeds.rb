# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

LOREM = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut 
labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi  
ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore
 eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum"


15.times do 
  Actor.create(name: "Michael", age: 35, about: LOREM, photo_url: "http://st.kp.yandex.net/images/actor_iphone/iphone360_659495.jpg")
end

6.times do 
  Article.create(title: "Title", body: LOREM, img_url: "http://media2.s-nbcnews.com/i/MSNBC/Components/Video/__NEW/ad_nbcn_ClaritinTEST_150423.jpg")
end

10.times do
  Movie.create(name: "Movie", box_office: 300, desc: LOREM, poster_url: "http://cdn.playbuzz.com/cdn/99e6ffb5-29c3-443c-8c0f-1a742e9ad385/1613fbe4-3314-4d54-8b3b-357b583f9d8b.jpg")
end