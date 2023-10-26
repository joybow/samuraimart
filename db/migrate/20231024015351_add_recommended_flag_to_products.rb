class AddRecommendedFlagToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :recommended_flag, :boolen, default: false
  end
end
