class SearchesController < ApplicationController
  def index
    @search = params[:search]
    @searched_item = Item.search(params[:search]).limit(132)
    @searched_item_images_top = ItemImage.includes(:item).group(:item_id).where(item_id:@searched_item.ids)
    @parents = Category.where(ancestry: nil)

  end
end
