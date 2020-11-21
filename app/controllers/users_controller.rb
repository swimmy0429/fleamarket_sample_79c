class UsersController < ApplicationController
  def show
    @parents = Category.where(ancestry: nil)

    #以下お気に入り機能の実装
    @user = User.find(params[:id])
    @items = @user.items
    @favorite_items = @user.favorite_items
  end

  def index
    @users = User.all
  end

end
