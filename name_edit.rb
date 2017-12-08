#text 폴더로 이동
Dir.chdir("text")

#폴더 내의 파일들을 확인하고, 파일명 수정
files = Dir.entries(Dir.pwd).reject {|i| i[0] == '.'} #.과 ..을 빼기 위한 작업
files.each do |name|
    File.rename(name, name.gsub("new","new_"))
end
