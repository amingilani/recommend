# <!-- BEGIN ANNOTATION -->
# ## Schema Information
#
# Table name: `recommendations`
#
# ### Columns
#
# Name                    | Type               | Attributes
# ----------------------- | ------------------ | ---------------------------
# **`id`**                | `integer`          | `not null, primary key`
# **`name`**              | `string`           |
# **`email`**             | `string`           |
# **`phone_number`**      | `string`           |
# **`phone_extension`**   | `string`           |
# **`fax_number`**        | `string`           |
# **`organization`**      | `string`           |
# **`position`**          | `string`           |
# **`subject`**           | `string`           |
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
#
# <!-- END ANNOTATION -->

require 'test_helper'

class RecommendationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
