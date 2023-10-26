class AddMajorCategoryIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :major_category, foriegn_key: true
  end
end
