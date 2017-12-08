require 'httparty'
require 'nokogiri'

#정보 크롤
url = "http://www.op.gg/summoner/userName="
puts "소환사 명을 입력하세요"
name = gets.chomp
response = HTTParty.get(URI.encode(url+name))

#Nokogiri 형식으로 바꾼 뒤 필요한 값만 id를 이용하여 검색
doc = Nokogiri::HTML(response)
result = doc.css(".WinRatioTitle")
total = result.css('.total')
win = result.css('.win')
lose = result.css('.lose')
puts "총#{total.text} 전 #{win.text}승 #{lose.text}패"