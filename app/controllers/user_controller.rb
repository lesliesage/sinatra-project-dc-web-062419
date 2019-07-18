class UserController < Sinatra::Base

    set :views, "app/views/users"
    set :method_override, true

    get '/users' do
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
        erb :show
    end


end