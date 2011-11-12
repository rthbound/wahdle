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
                  :destination_id => 2,
                  :starts_on => "11/11/11",
                  :ends_on => "11/11/12",
                  :guest_list => "luiscvega@gmail.com, bartlingalex@gmail.com, dmlevi@gmail.com, rudyonrails@gmail.com")
                  
trip.guest_list.split(", ").each do |email|
  trip.users.create(:email => email, :password => "password", :password_confirmation => "password")
end