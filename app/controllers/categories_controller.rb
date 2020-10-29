class CategoriesController < ApplicationController
  before_action :find_category, only: [:parent, :child, :grandchild]

  def parent
    grandchildren_id = @category.indirect_ids 
    find_category_item(grandchildren_id)
    # binding.pry
  end

  def child
    grandchildren_id = @category.child_ids
    find_category_item(grandchildren_id)
  end

  def grandchild
    @items = []
    category_item = Item.includes(:item_images).where(category: params[:id])
    category_present(category_item)
  end

  private

  def find_category
    @items = Item.all
    @item_images_top = ItemImage.includes(:item).group(:item_id)
    @category = Category.find(params[:id])
    @parents = Category.where(ancestry: nil)
  end

  def category_present(category_item)
    if category_item.present?
      @items += category_item
    end
  end

  def find_category_item(grandchildren_id)
    @items = []
    category_item = []
    grandchildren_id.each do |grandchild_id|
      category_item = Item.includes(:item_images).where(category: grandchild_id)
      category_present(category_item)
    end
  end 
end
