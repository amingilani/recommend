class AddPhoneNumberFormattedToRecommendations < ActiveRecord::Migration[5.1]
  def change
    add_column :recommendations, :phone_number_formatted, :string
  end
end
