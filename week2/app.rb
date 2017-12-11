require 'sinatra'

#localhost:4567
get '/' do #'/' 는 root를 의미
    send_file 'index.html'
end

#localhost:4567/welcome
get '/welcom' do
    send_file 'welcom.html'
end

get '/squre/:num' do
    @num = params[:num]
    erb :hello
end

get '/welcom/:name' do
    @name = params[:name] # @ 다른 파일에 값을 넘겨 줄 수 있음
    erb :name
end

get '/lotto' do
    @lotto = (1..45).to_a.sample(6)
    erb :lotto
end

get '/google' do
    erb :google
end

get '/search' do
    @q = params[:q]
    @name = params[:name]
    erb :search
end