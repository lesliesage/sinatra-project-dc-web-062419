class RestaurantController < Sinatra::Base

    set :views, "app/views/restaurants"
    set :method_override, true

    get '/restaurants' do
        erb :index
    end

    get '/restaurants/new' do
        # renders form
        erb :new
    end

    post '/restaurants' do
        # form params
        redirect 'restaurants/@restaurant.id'
    end

    get '/restaurants/:id' do
        id = params[:id]
        @restaurant = Restaurant.find(id)
        erb :show
    end

end