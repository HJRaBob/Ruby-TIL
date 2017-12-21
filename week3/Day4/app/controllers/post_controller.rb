class PostController < ApplicationController
  before_action :authorize, except: [:index,:show]
  def index
    @posts = Post.all
  end
  
  def new
  end
  
  def create
    Post.create(:user_id =>current_user.id,:title =>params[:title],:content=>params[:content])
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    Post.find(params[:id]).update(:user_id =>current_user.id,:title =>params[:title],:content=>params[:content])
    redirect_to "/show/#{params[:id]}"
  end
  
  def destroy
    Post.find(params[:id]).destroy
    redirect_to '/'
  end
  
  def show
    @post = Post.find(params[:id])
    @comment = Comment.all
  end

  def comment
    Comment.create(:user_id =>current_user.id,:comment=>params[:content],:post_id =>params[:id])
    redirect_to "/show/#{params[:id]}"
  end

  def de_comment
    Comment.find(params[:id]).destroy
    redirect_to :back
  end
end
