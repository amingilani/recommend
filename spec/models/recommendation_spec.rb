# ## Schema Information
#
# Table name: `recommendations`
#
# ### Columns
#
# Name                    | Type               | Attributes
# ----------------------- | ------------------ | ---------------------------
# **`id`**                | `integer`          | `not null, primary key`
# **`email`**             | `string`           |
# **`phone_number`**      | `string`           |
# **`fax_number`**        | `string`           |
# **`organization`**      | `string`           |
# **`position`**          | `string`           |
# **`body`**              | `text`             |
# **`signature_id`**      | `string`           |
# **`signature_status`**  | `integer`          |
# **`address_line_1`**    | `string`           |
# **`address_line_2`**    | `string`           |
# **`address_city`**      | `string`           |
# **`address_state`**     | `string`           |
# **`address_zip`**       | `string`           |
# **`address_country`**   | `string`           |
# **`created_at`**        | `datetime`         | `not null`
# **`updated_at`**        | `datetime`         | `not null`
# **`slug`**              | `string`           | `not null`
# **`first_name`**        | `string`           | `not null`
# **`last_name`**         | `string`           | `not null`
#
# ### Indexes
#
# * `index_recommendations_on_slug` (_unique_):
#     * **`slug`**
#

require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  it 'should be invalid if empty' do
    recommendation = Recommendation.new
    recommendation.valid?
    expect(recommendation.errors.keys).to include(
      :first_name,
      :last_name,
      :email,
      :phone_number,
      :organization,
      :position,
      :body,
      :address_line_1,
      :address_city,
      :address_state,
      :address_zip,
      :address_country
    )
  end
end
