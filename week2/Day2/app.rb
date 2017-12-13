require 'sinatra'
require 'sinatra/reloader'
require 'csv'
require 'date'
require 'uri'
require 'nokogiri'
require 'httparty'

get '/vote' do
    erb :vote
end

get '/result' do
    @count = params[:count]
    erb :result
end

get '/lolfinder' do
    erb :lolfinder
end

get '/lol' do
    @username = params[:user]
    url = "http://www.op.gg/summoner/userName=#{@username}"
    url = URI.encode(url)
    response = HTTParty.get(url)
    doc = Nokogiri::HTML(response)
    @win = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.wins")
    @lose = doc.css("#SummonerLayoutContent > div.tabItem.Content.SummonerLayoutContent.summonerLayout-summary > div.SideContent > div.TierBox.Box > div.SummonerRatingMedium > div.TierRankInfo > div.TierInfo > span.WinLose > span.losses")
    erb :lol
end

get '/users' do
    @users = []
    CSV.foreach('user.csv') do |row|
        @users << row
    end
    erb :users
end

get '/' do
    erb :index
end

get '/welcome/:name' do
    @name = params[:name]
    @time = Time.now.to_s
    CSV.open('user.csv','a+') do |data|
        data << [@name.to_s, Time.now.to_s]
    end
    erb :welcome
end
