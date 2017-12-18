require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

    class Post
    include DataMapper::Resource
    property :id, Serial
    property :title, String
    property :content, Text
    property :created_at, DateTime
    end


DataMapper.finalize
Post.auto_upgrade!


get '/' do
    @posts = Post.all
    erb :index
end

get '/post' do
    erb :post
end

get '/create' do
    @title = params[:title]
    @content = params[:content]
    Post.create(:title => @title,:content => @content)
    erb :create
end

get '/welcome/:id' do
    @posts = Post.get(params[:id])
    erb :posts
end

get '/delet/:id' do
    @posts = Post.get(params[:id])
    @posts.destroy
    redirect '/'
end

get '/welcome/:name' do
    @name = params[:name]
    erb :welcome
end

get '/edit/:id' do
    @post = Post.get(params[:id])
    erb :edit
end

get '/update/:id' do
    @post = Post.get(params[:id])
    @post.update(:title => params[:title], :content => params[:content] )
    redirect '/'
end