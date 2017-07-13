class CreateRecommendations < ActiveRecord::Migration[5.1]
  def change
    create_table :recommendations do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.string :phone_extension
      t.string :fax_number
      t.string :organization
      t.string :position
      t.string :subject
      t.text :body
      t.string :signature_id
      t.integer :signature_status
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_city
      t.string :address_state
      t.string :address_zip
      t.string :address_country

      t.timestamps
    end
  end
end
