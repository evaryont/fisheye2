# ## Schema Information
#
# Table name: `users`
#
# ### Columns
#
# Name                          | Type               | Attributes
# ----------------------------- | ------------------ | ---------------------------
# **`id`**                      | `integer`          | `not null, primary key`
# **`email`**                   | `string(255)`      | `default(""), not null`
# **`encrypted_password`**      | `string(255)`      | `default(""), not null`
# **`reset_password_token`**    | `string(255)`      |
# **`reset_password_sent_at`**  | `datetime`         |
# **`remember_created_at`**     | `datetime`         |
# **`sign_in_count`**           | `integer`          | `default(0), not null`
# **`current_sign_in_at`**      | `datetime`         |
# **`last_sign_in_at`**         | `datetime`         |
# **`current_sign_in_ip`**      | `string(255)`      |
# **`last_sign_in_ip`**         | `string(255)`      |
# **`created_at`**              | `datetime`         |
# **`updated_at`**              | `datetime`         |
# **`name`**                    | `string(255)`      |
# **`confirmation_token`**      | `string(255)`      |
# **`confirmed_at`**            | `datetime`         |
# **`confirmation_sent_at`**    | `datetime`         |
# **`unconfirmed_email`**       | `string(255)`      |
#
# ### Indexes
#
# * `index_users_on_email` (_unique_):
#     * **`email`**
# * `index_users_on_reset_password_token` (_unique_):
#     * **`reset_password_token`**
#

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    # This password needs to be complex enough to pass zxcvbn!
    password 'a5L%jas^dfkU3j#w8lk@asdfo!ja`slLfJAsd1fJ'
    password_confirmation 'a5L%jas^dfkU3j#w8lk@asdfo!ja`slLfJAsd1fJ'
    # required if the Devise Confirmable module is used
    confirmed_at Time.now
  end
end
