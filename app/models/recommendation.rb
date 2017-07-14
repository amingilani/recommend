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
#

class Recommendation < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :fax_number
  validates_presence_of :organization
  validates_presence_of :position
  validates_presence_of :body
  validates_presence_of :address_line_1
  validates_presence_of :address_city
  validates_presence_of :address_state
  validates_presence_of :address_zip
  validates_presence_of :address_country
end
