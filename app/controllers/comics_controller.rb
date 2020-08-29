class ComicsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @comic = Comic.find(params[:id])
  end

  def new
    @comic = current_user.comics.build 
  end

  def create
    @comic = current_user.comics.build(comic_params)
    if @comic.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @comics = current_user.comics.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def edit
    @comic = current_user.comics.find(params[:id])
  end

  def update
    
    @comic = current_user.comics.find(params[:id])
    
    if @comic.update(comic_params)
      flash[:success] = 'Comic は正常に更新されました'
      redirect_to root_url
    else
      flash.now[:danger] = 'Comic は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @comic.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def comic_params
    params.require(:comic).permit(:tittle, :author, :price, :review, :picture)
  end
  
  def correct_user
    @comic = current_user.comics.find_by(id: params[:id])
    unless @comic
      redirect_to root_url
    end
  end
  
end
