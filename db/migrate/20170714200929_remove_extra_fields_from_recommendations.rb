class RemoveExtraFieldsFromRecommendations < ActiveRecord::Migration[5.1]
  def change
    remove_column :recommendations, :phone_extension
    remove_column :recommendations, :subject
  end
end
