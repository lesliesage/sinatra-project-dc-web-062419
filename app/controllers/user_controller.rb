class UserController < Sinatra::Base

    set :views, "app/views/users"
    set :method_override, true

    get '/users' do
        @users = User.all
        erb :index
    end

    get '/users/new' do
        # renders form
        erb :new
    end

    post '/users' do
        # form params
        redirect 'users/@user.id'
    end

    get '/users/:id' do
        id = params[:id]
        @user = User.find(id)
        @restaurants = @user.restaurants
        erb :show
    end
end
