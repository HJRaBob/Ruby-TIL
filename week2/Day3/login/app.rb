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
    passwd2 = params[:passwd2]

    if passwd == passwd2
        CSV.open("inform.csv","a+") do |data|
            data << [@name ,@email, passwd]
        end
        erb :complete
    else
        redirect '/signup'
    end
end