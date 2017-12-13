require 'sinatra'
require 'csv'

get '/' do
    send_file "index.html"
end

get '/signup' do
    erb :signup
end

get '/complete' do
    @name = params[:name]
    @email = params[:email]
    passwd = params[:passwd]
    CSV.open("inform.csv","a+") do |data|
        data << [@name ,@email, passwd]
    end
    erb :complete
end