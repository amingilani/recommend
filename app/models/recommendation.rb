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

class Recommendation < ApplicationRecord
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_presence_of :phone_number
  validates_presence_of :organization
  validates_presence_of :position
  validates_presence_of :body
  validates_presence_of :address_line_1
  validates_presence_of :address_city
  validates_presence_of :address_state
  validates_presence_of :address_zip
  validates_presence_of :address_country

  before_create :set_slug

  def to_param
    slug
  end

  def name
    "#{first_name} #{last_name}"
  end

  def body_pretty
    Kramdown::Document.new(body).to_html
  end

  def address_country_pretty
    ISO3166::Country[address_country]
  end

  private

  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      break unless Recommendation.where(slug: slug).exists?
    end
  end
end
