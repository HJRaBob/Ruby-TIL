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

