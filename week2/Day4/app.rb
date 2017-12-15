require 'sinatra'
require 'data_mapper'

DataMapper::setup(:default, "sqlite3://#{Dir.pwd}/blog.db")

    class Post
        include DataMapper::Resource
        property :id, Serial
        property :title, String
        property :content, Text
        property :created_at, DateTime
    end

    class User
        include DataMapper::Resource
        property :id, Serial
        property :email, String
        property :passwd, Text
        property :created_at, DateTime
    end

DataMapper.finalize

Post.auto_upgrade!
User.auto_upgrade!

set :bind, '0.0.0.0'

get '/' do
    @posts = Post.all.reverse
    erb :index
end

get '/post' do
    erb :post
end

get '/complete' do
    #Post.create(:title => params[:title],:content => params[:content])
    @title = params[:title]
    @content = params[:content]
    Post.create(title: @title,content: @content)
    erb :complete
end

get '/signup' do
    erb :signup
end

get '/usercomplete' do
    @email = params[:email]
    @passwd = params[:passwd]
    User.create(email: @email,passwd: @passwd)
    erb :usercomplete
end

get '/users' do
    @users = User.all.reverse
    erb :users
end