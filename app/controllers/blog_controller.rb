class BlogController < Sinatra::Base
  set :views, "app/views/blogs"
  set :method_override, true

    get '/blogs' do
      @blogs = Blog.all
      erb :index
    end

    get '/blogs/new' do
      if session[:user_id]
        @user_id = session[:user_id]
        erb :new
      else
      redirect '/'
      end
    end

    get '/blogs/:id' do
      @blog = blog.find(params[:id])
      erb :show
    end

    get '/blogs/:id/edit' do
      @blog = blog.find(params[:id])
      erb :edit
    end

    post '/blogs' do
      title = params[:title]
      body = params[:body]
      category = params[:category]
      user_id = params[:user_id]
      blog = Blog.create(title: title, body: body, category: category, user_id: user_id)
      redirect "/blogs/#{blog.id}"
    end

    patch '/blogs/:id' do
      blog = blog.find(params[:id])
      blog.title = params[:title]
      blog.save
      redirect "/blogs/#{blog.id}"
    end

    delete '/blogs/:id' do
      blog = blog.find(params[:id])
      blog.delete
      redirect "/blogs"
    end
end
