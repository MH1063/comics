class ToppagesController < ApplicationController
  def index
    if logged_in?
      @comics = Comic.all.order(id: :desc).page(params[:page])
    end
  end
end
