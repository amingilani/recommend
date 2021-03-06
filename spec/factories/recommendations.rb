# ## Schema Information
#
# Table name: `recommendations`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `integer`          | `not null, primary key`
# **`email`**                   | `string`           |
# **`phone_number`**            | `string`           |
# **`fax_number`**              | `string`           |
# **`organization`**            | `string`           |
# **`position`**                | `string`           |
# **`body`**                    | `text`             |
# **`signature_id`**            | `string`           |
# **`address_line_1`**          | `string`           |
# **`address_line_2`**          | `string`           |
# **`address_city`**            | `string`           |
# **`address_state`**           | `string`           |
# **`address_zip`**             | `string`           |
# **`address_country`**         | `string`           |
# **`created_at`**              | `datetime`         | `not null`
# **`updated_at`**              | `datetime`         | `not null`
# **`slug`**                    | `string`           | `not null`
# **`first_name`**              | `string`           | `not null`
# **`last_name`**               | `string`           | `not null`
# **`signature_date`**          | `datetime`         |
# **`phone_number_formatted`**  | `string`           |
#
# ### Indexes
#
# * `index_recommendations_on_slug` (_unique_):
#     * **`slug`**
#

FactoryGirl.define do
  factory :recommendation do
    first_name 'John'
    last_name 'Smith'
    email 'abc@hello.com'
    phone_number '415 111 1111'
    organization 'Acme Corp'
    position 'Founter & CEO'
    body 'asdasda asdasda asdasd'
    address_line_1 '33 Market St'
    address_city 'Random City'
    address_state 'California'
    address_zip '94104'
    address_country 'US'
  end
end
