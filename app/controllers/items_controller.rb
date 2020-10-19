class ItemsController < ApplicationController

  before_action :set_parents, only: [:new, :create]

  def index
    @items = Item.includes(:item_images).order('created_at DESC')
    @items = Item.all.where.not(trading_status:2)
    @item_images_top = ItemImage.all.includes(:item).group(:item_id)
  end

  def new
    @item = Item.new
    @item.item_images.new
    @address = Prefecture.all
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
    @item = Item.new(item_params)
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end

  def set_parents
    @parents = Category.where(ancestry: nil)
  end

  def search
    respond_to do |format|
      format.html
      format.json do
        #子カテゴリーを探して変数@childrensに代入します！
        @childrens = Category.find(params[:parent_id]).children
      end
    end
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :item_condition, :shipping_charge_players, :prefecture_code, :size, :preparation_day, :category, :brand, :delivery_type, item_images_attributes: [:src, :_destroy, :id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
  

end
