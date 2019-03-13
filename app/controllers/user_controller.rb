class UserController < Sinatra::Base
  set :views, "app/views/users"
  set :method_override, true

    get '/users' do

      erb :index
    end

    get '/users/new' do
      erb :new
    end

    get '/users/:id' do
      user = User.find(params[:id])
    end

    get '/users/:id/edit' do

    end

    post '/users' do
      name = params[:name]
      user = User.create(name: name)
      redirect '/users/#{user.id}'
    end

    patch '/users/:id' do

    end

    delete 'users/:id' do

    end
end
