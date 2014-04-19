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

require 'spec_helper'

describe User do

  it 'should require an email address' do
    no_email_user = build(:user, email: '')
    expect(no_email_user).not_to be_valid
  end

  it 'should accept valid email addresses' do
    addresses = %w(user@foo.com THE_USER@foo.bar.org first.last@foo.jp)
    addresses.each do |address|
      valid_email_user = create(:user, email: address)
      expect(valid_email_user).to be_valid
    end
  end

  it 'should reject invalid email addresses' do
    addresses = %w(user@foo,com user_at_foo.org example.user@foo.)
    addresses.each do |address|
      invalid_email_user = build(:user, email: address)
      expect(invalid_email_user).not_to be_valid
    end
  end

  it 'should reject duplicate email addresses' do
    create(:user)

    user_with_duplicate_email = build(:user)
    expect(user_with_duplicate_email).not_to be_valid
  end

  it 'should reject duplicate email addresses regardless of case' do
    create(:user, email: 'USER@EXAMPLE.COM')

    user_with_duplicate_email = build(:user, email: 'user@example.com')
    expect(user_with_duplicate_email).not_to be_valid
  end

  describe 'passwords' do
    let(:user) { create(:user) }

    it 'should have a password attribute' do
      expect(user).to respond_to(:password)
    end

    it 'should have a password confirmation attribute' do
      expect(user).to respond_to(:password_confirmation)
    end
  end

  describe 'password validations' do
    it 'should require a password' do
      expect(build(:user, password: '', password_confirmation: '')).not_to be_valid
    end

    it 'should require a matching password confirmation' do
      expect(build(:user, password_confirmation: '')).not_to be_valid
    end

    it 'should reject short passwords' do
      short = 'a' * 5
      expect(build(:user, password: short, password_confirmation: short)).not_to be_valid
    end
  end

  describe 'password encryption' do
    let(:user) { create(:user) }

    it 'should have an encrypted password attribute' do
      expect(user).to respond_to(:encrypted_password)
    end

    it 'should set the encrypted password attribute' do
      expect(user.encrypted_password).not_to be_blank
    end
  end
end
