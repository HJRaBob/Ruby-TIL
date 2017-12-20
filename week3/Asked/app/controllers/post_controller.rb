class PostController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
  end
  
  def create
    Post.create(:username=>params[:username],:title =>params[:title],:content=>params[:content])
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end
  
  def update
    Post.find(params[:id]).update(:username=>params[:username],:title =>params[:title],:content=>params[:content])
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
    Comment.create(:comment=>params[:content],:post_id =>params[:id])
    redirect_to "/show/#{params[:id]}"
  end

  def de_comment
    Comment.find(params[:id]).destroy
    redirect_to :back
  end
end
