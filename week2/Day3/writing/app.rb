require 'sinatra'
require 'csv'
#require 'sinatra-reloader'

get '/' do
    send_file "index.html"
end

get '/post' do
    erb :post
end

get '/complete' do
    @title = params[:title]
    @contain = params[:contain]
    CSV.open('write.csv','a+') do |data|
        data << [@title, @contain]
    end
    erb :complete
end

get '/posts' do
    @posts =[]
    CSV.foreach('write.csv',encoding: 'utf-8') do |row|
        @posts << row
    end
    erb :posts
end
