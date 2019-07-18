class RestaurantController < Sinatra::Base

    set :views, "app/views/restaurants"
    set :method_override, true

    get '/restaurants' do
        @restaurants = Restaurant.all
        erb :index
    end

    get '/restaurants/new' do
        # renders form
        erb :new
    end

    post '/restaurants' do
        redirect
    end

    post '/restaurants/:id' do
        Signup.find_or_create_by(restaurant_id: params[:id], user_id: params[:user_id])
        # @restaurant = Restaurant.find(id)
        redirect "restaurants/#{params[:id]}"
        erb :show
    end

    get '/restaurants/:id' do
        id = params[:id]
        @restaurant = Restaurant.find(id)
        @signedup_users = @restaurant.users
        @other_users = User.all - @restaurant.users
        erb :show
    end

end
