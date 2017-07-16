class AddSignatureDateToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :signature_date, :datetime
    remove_column :recommendations, :signature_status
  end
end
