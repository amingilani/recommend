# frozen_string_literal: true
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

class Recommendation < ApplicationRecord
  validates :first_name,      presence: true
  validates :last_name,       presence: true
  validates :email,           presence: true
  validates :phone_country,   presence: true
  validates :phone_number,    presence: true
  validates :organization,    presence: true
  validates :position,        presence: true
  validates :body,            presence: true
  validates :address_line_1,  presence: true
  validates :address_city,    presence: true
  validates :address_state,   presence: true
  validates :address_zip,     presence: true
  validates :address_country, presence: true

  before_create :set_slug
  before_save :set_phone_number_formatted

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

  def phone_number_formatted
    phone = TelephoneNumber.parse(phone_number, address_country)
    self.phone_number_formatted = "+#{phone.international_number}" if phone.valid?
  end

  def set_slug
    loop do
      self.slug = SecureRandom.uuid
      break unless Recommendation.where(slug: slug).exists?
    end
  end
end
