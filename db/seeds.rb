# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

cities = ["Las Vegas", "Chicago", "New York", "Boston", "Miami", "Los Angeles", "San Francisco"]
cities.each do |city|
  Destination.create(:city => city)
end

user = User.create(:name => "Wahdle", :password_confirmation => "wahdle", :password => "wahdle", :email => "wahdle@wahdle.com")

trip = user.trips.create(:name => "Code Academy",
                  :destination => "Chicago",
                  :starts_on => "11/11/11",
                  :ends_on => "11/11/12")
                