# Load the rails application
require File.expand_path('../application', __FILE__)

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

ActionMailer::Base.delivery_method = :smtp

# Initialize the rails application
AREAV03::Application.initialize!

ActionMailer::Base.smtp_settings = {
    :address              => 'smtp.gmail.com',
    :port                 => '587',
    :domain               => 'itecsde@gmail.com',
    :user_name            => 'itecsde@gmail.com',
    :password             => 'robertomiguel',
    :authentication       => 'plain',
    :enable_starttls_auto => true  }