class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @article = Article.all.order("created_at Desc")
    @articles = Article.paginate(page: params[:page], per_page: 6).order("created_at Desc")
    @user = User.find(params[:id])
  end
end
