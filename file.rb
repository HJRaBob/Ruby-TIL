#file.rb의 위치는 Ruby 폴더 안에 있다
#text 폴더 안으로 들어간다
Dir.chdir("text")

#파일을 만든다
20.times do |i|
    File.open("newfile#{i+1}.txt","w+") do |file|
        #파일의 내용을 입력한다
        file.write("Hello rabob")
    end
end