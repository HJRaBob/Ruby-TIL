class HomeController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
  end

  def complete
    #db에 저장
    Post.create(:username => params[:username], :title => params[:title], :content=> params[:content])
    redirect_to '/'
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    puts "done"
    Post.find(params[:id]).destroy
    puts "done"
    redirect_to '/'
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    post = Post.find(params[:id])
    post.update(:username => params[:username], :title => params[:title], :content => params[:content])
    redirect_to "/show/#{params[:id]}"
  end

end
