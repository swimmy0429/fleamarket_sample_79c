class ItemsController < ApplicationController
  def index
    @items = Item.all.where.not(trading_status:2)
    @item_images = ItemImage.all.includes(:item)
  end
  
end
