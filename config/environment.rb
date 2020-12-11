# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
  address: 'in-v3.mailjet.com',
  port: 587,
  domain: 'gmail.com',
  authentication: 'plain',
  enable_starttls_auto: true,
  user_name: ENV['MJ_APIKEY_PUBLIC'],
  password: ENV['MJ_APIKEY_PRIVATE']
}
