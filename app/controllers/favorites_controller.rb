class FavoritesController < ApplicationController

  before_action :set_parents
  before_action :set_item
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  
  def index
    @user = current_user
    @favorites = Favorite.where(user_id: @user.id).all
  end
  
  # お気に入り登録
  def create
    # if current_user.id != @item.user.id
    # end
      
    favorite = current_user.favorites.build(item_id: params[:item_id])
    favorite.save!
   
  end

  # お気に入り削除
  def destroy
    
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    
  end

  #お気に入り一覧表へのルーティングでparentsが引っかかるため記述
  private

  def set_item
    @item = Item.find(params[:item_id])
  end


  def set_parents
    @parents = Category.where(ancestry: nil)
  end
end