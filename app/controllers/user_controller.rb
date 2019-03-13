class UserController < Sinatra::Base
  set :views, "app/views/users"
  set :method_override, true
  enable :sessions

    get '/' do
      erb :login
    end

    post '/' do
      user_name = params[:user_name]
      find_user = User.find_by(name: user_name)
      if find_user
        session[:user_id] = find_user.id
        redirect "/users/#{find_user.id}"
      else
        redirect '/'
      end
    end

    get '/users' do
      @users = User.all
      erb :index
    end

    get '/users/new' do
      erb :new
    end

    get '/users/:id' do
      @user = User.find(params[:id])
      erb :show
    end

    get '/users/:id/edit' do
      @user = User.find(params[:id])
      erb :edit
    end

    post '/users' do
      name = params[:name]
      user = User.create(name: name)
      redirect "/users/#{user.id}"
    end

    patch '/users/:id' do
      user = User.find(params[:id])
      user.name = params[:name]
      user.save
      redirect "/users/#{user.id}"
    end

    delete '/users/:id' do
      user = User.find(params[:id])
      user.delete
      redirect "/users"
    end
end
