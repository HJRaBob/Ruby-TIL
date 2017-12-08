require 'httparty'
require 'nokogiri'

#정보 크롤
url = "http://finance.naver.com/sise/"
response = HTTParty.get(url)

#Nokogiri 형식으로 바꾼 뒤 필요한 값만 id를 이용하여 검색
doc = Nokogiri::HTML(response)
kospi = doc.css("#KOSPI_now")
puts kospi.text