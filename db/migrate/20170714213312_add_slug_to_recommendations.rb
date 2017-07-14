class AddSlugToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :slug, :string, null: false
    add_index :recommendations, :slug, unique: true
  end
end
