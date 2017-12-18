require 'sinatra'
require 'sinatra/reloader'
require 'data_mapper'

#Data Mapper 설계
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

#메인페이지 : 글 목록을 보여줘야함 << DB의 값이 필요
get '/' do
    @post = Post.all.reverse
    erb :index
end

#글쓰기 페이지
get '/write' do
    erb :write
end

get '/write/complete' do
    Post.create(:title => params[:title],:content => params[:content])
    redirect '/'
end

#글 읽기
get '/read/:id' do
    @post = Post.get(params[:id])
    erb :read
end

#글 수정 페이지
get '/edit/:id' do
    @post = Post.get(params[:id])
    erb :edit
end

get '/edit/:id/complete' do
    Post.get(params[:id]).update(:title => params[:title],:content => params[:content])
    redirect '/'
end

#글 삭제 페이지
get '/delet/:id' do
    Post.get(params[:id]).destroy
    redirect '/'
end