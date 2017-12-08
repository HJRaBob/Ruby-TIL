require 'launchy'
idol = ["아이유","하이라이트","방탄소년단"]
url = 'https://search.naver.com/search.naver?where=nexearch&sm=top_hty&fbm=1&ie=utf8&query='

idol.each do |name|
    Launchy.open(url+name)
end
