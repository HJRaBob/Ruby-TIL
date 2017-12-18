class HomeController < ApplicationController
  def index
    @name = "rabob"
  end

  def lunch
    @menu = ["순남 시래기","만면희색", "대독장", "순두부 찌개", "두부마을"]
  end

  def vote
  end

  def result
    @vote = params[:vote]
  end

end
