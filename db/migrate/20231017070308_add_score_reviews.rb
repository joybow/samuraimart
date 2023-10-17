class AddScoreReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :scrore, :integer, :unsigned => true, :default => 0
  end
end
