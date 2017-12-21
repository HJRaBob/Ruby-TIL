class UserController < ApplicationController
    def index
        @users = User.all
    end
    
    def new
    end

    def create
        User.create(:name => params[:name],:email=>params[:email],:password=>params[:password])
        @user = User.last
    end
    
    def login 
    end

    def login_process
        @user = User.find_by(:email => params[:email])
        @msg = ""
        if @user.nil?
            flash[:alert] = "등록되지 않은 회원입니다. 등록해 주세요" 
            redirect_to '/user/new'
        else
            if @user.password == params[:password]
                flash[:notice] = "로그인 성공!!"
                session[:user_id] = @user.id
                redirect_to '/'
            else
                flash[:alert] = "일치하지 않는 비밀번호 입니다."
                redirect_to :back
            end
        end
    end

    def logout
        session.clear
        redirect_to '/'
    end
end
