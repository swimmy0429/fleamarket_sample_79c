class FavoritesController < ApplicationController

  before_action :set_item
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）

  # お気に入り登録
  def create
    # @favorite = Favorite.create(user_id: current_user.id, item_id: @item.id)
    favorite = current_user.favorites.build(item_id: params[:item_id])
    favorite.save
    # redirect_to items_show_path
  end

  # お気に入り削除
  def destroy
    # @favorite = Favorite.find_by(user_id: current_user.id, item_id:@item.id).destory
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    # redirect_to items_show_path
  end

  # def show
  #   @user = User.find(params[:id])
  #   @items = @user.items

  #   @favorite_items = @user.favorites.map{|favorite| favorite.tweet}

  private
  def set_item
    @item = Item.find(params[:item_id])
  end
end