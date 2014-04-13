# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# Create the seeded admin user. See ADMIN_NAME, ADMIN_EMAIL, ADMIN_PASSWORD
user = User.find_or_create_by!(email: Rails.application.secrets.admin_email) do |user|
         user.password = Rails.application.secrets.admin_password
         user.password_confirmation = Rails.application.secrets.admin_password
         user.name = Rails.application.secrets.admin_name
         user.confirm!
       end
puts 'CREATED ADMIN USER: ' << user.email

# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
