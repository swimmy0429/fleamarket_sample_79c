class ItemsController < ApplicationController
  def index
    @items = Item.all.where.not(trading_status:2)
    @item_images_top = ItemImage.all.includes(:item).group(:item_id)
  end
  def show
    @items_show = Item.all.where(id:params[:id])
    @item_images_detail = ItemImage.all.includes(:item).where(item_id:params[:id])
  end
end
