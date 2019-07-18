require_relative '../config/environment'

Restaurant.destroy_all
User.destroy_all
Signup.destroy_all

def get_response
    client = Yelp::Fusion.client
    resp = client.search('Rome', {term: 'pizza'})
    resp
end

counter = 0

get_response.businesses.size.times do
    Restaurant.create(
        name: get_response.businesses[counter].name,
        rating: get_response.businesses[counter].rating.to_i,
        address: get_response.businesses[counter].location.address1
        )
    counter +=1
end

harum = User.create(name: "Harum the Witch Helmy")
leslie = User.create(name: "Leslie the Wise Old Sage")

Signup.create(user_id: harum.id, restaurant_id: Restaurant.all.first.id)
Signup.create(user_id: leslie.id, restaurant_id: Restaurant.all.first.id)
Signup.find_or_create_by(user_id: leslie.id, restaurant_id: Restaurant.all.sample.id)
Signup.find_or_create_by(user_id: harum.id, restaurant_id: Restaurant.all.sample.id)
Signup.find_or_create_by(user_id: leslie.id, restaurant_id: Restaurant.all.sample.id)
Signup.find_or_create_by(user_id: harum.id, restaurant_id: Restaurant.all.sample.id)
