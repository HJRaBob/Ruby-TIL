# 기본 깃 사용법

## 깃 기본 명령

1. 기본 시작

    `git init`

1. git에 저장

    `git add .`

    `git commit -m "message"`

## 원격 저장소에 등록

`git remote add origin "address"`

## 원격 저장소에 저장

`git push -u origin master`

## markdown 문법

* 순서가

* 없는

* 리스트 (*)

1. 순서가
    >내부의설명을 이런 방식으로 할 수 있다. 단, 이중으로 사용하는 방식은 아직 확인 할 수 없다. 긴 설명도 무리없이 가능하다. 더 길게 쓰고싶지만 더이상 생각나는 말이 없다. 이정도면 충분히 길게 보일거라 생각한다.
1. 있는
1. 리스트

`ruby file.rb`

```Ruby
this is code box
#comment like this
#highlight for syntex
(1..5)each do |i|
    puts i
end
```

***

* __Bold__
* _italic_
* *I **can** combine*