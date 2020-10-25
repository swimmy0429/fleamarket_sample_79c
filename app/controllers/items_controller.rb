class ItemsController < ApplicationController
  def index

    @items = Item.includes(:item_images).order('created_at DESC')
    @items = Item.where.not(trading_status:2)
    @item_images_top = ItemImage.includes(:item).group(:item_id)
  end

  def show
    @items_show = Item.where(id:params[:id])
    @item_images_detail = ItemImage.all.includes(:item).where(item_id:params[:id])
    @nickname = Item.find(params[:id]).seller.nickname
  end

  def new
    @item = Item.new
    @item.item_images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @itme.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :item_condition_id, :shipping_charge_players, :prefecture_code, :size_id, :preparation_day, :category, :brand, :delivery_type, :seller_id, item_images_attributes: [:src, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end


    #@items = Item.all.where.not(trading_status:2)
    #@item_images_top = ItemImage.all.includes(:item).group(:item_id)
end
