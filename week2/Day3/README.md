# Day3 내용


### 1. Sinatra 연습

1. 글쓰기 페이지

    1. main page에 `글쓰로 가기` 링크 만들기

    1. `/post` 페이지에 글을 쓸 수 있는 구성 만들기

        * 글 제목을 입력할 수 있는 text form

        * 글 내용을 입력할 수 있는 text area

        * 글을 저장할 수 있는 submit -> `/complete` 로 이동

    1. `/complete` 페이지

        * 저장이 완료되었음을 확인

        * 글의 제목을 보여줌

        * 글의 내용을 보여줌

        * 수정으로 돌아가는 버튼

        * 최종 저장 버튼

1. 로그인 페이지

    1. main page에 `회원가입` 링크 만들기

    1. `/signup` 페이지에 글을 쓸 수 있는 구성 만들기

        * 이름을 입력할 수 있는 text form

        * email을 입력할 수 있는 email form

        * passwd를 입력할 수 있는 passwd form

        * 가입을 완료하는 submit -> `/complete` 로 이동

    1. `/complete` 페이지

        * 가입이 완료되었음을 확인

        * 회원 이름을 보여줌

        * 가입 이메일을 보여줌