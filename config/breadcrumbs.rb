crumb :root do
  link "トップページ", root_path, class: "pankuzu"
end

crumb :category_index do
  link "カテゴリー一覧", root_path, class: "pankuzu"
end

# 親カテゴリーのパンくず
crumb :parent_category do |category|
  category = Category.find(params[:id]).root
  link "#{category.name}", parent_category_path(category)
  parent :category_index
end
# -----------------------------------------------------------------
# 子カテゴリーのパンくず
crumb :child_category do |category|
  category = Category.find(params[:id])
  # 表示しているページが子カテゴリーの一覧ページの場合
  if category.has_children?
    link "#{category.name}", child_category_path(category)
    parent :parent_category

  # 表示しているページが孫カテゴリーの一覧ページの場合
  else
    link "#{category.parent.name}", child_category_path(category.parent)
    parent :parent_category
  end
end
# -----------------------------------------------------------------
# 孫カテゴリーのパンくず
crumb :grandchild_category do |category|
  category = Category.find(params[:id])
  link "#{category.name}", grandchild_category_path(category)
  parent :child_category
end