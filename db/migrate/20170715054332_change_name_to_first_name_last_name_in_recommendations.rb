class ChangeNameToFirstNameLastNameInRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :first_name, :string, null: false
    add_column :recommendations, :last_name, :string, null: false
    remove_column :recommendations, :name
  end
end
