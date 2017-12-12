ActionMailer::Base.smtp_settings = {
  :user_name => ENV['SENDGRID_API_ID'],
  :password => ENV['SENDGRID_API_KEY'],
  :domain => 'localhost:3000',
  :address => 'smtp.sendgrid.net',
  :port => 25,
  :authentication => :plain,
  :enable_starttls_auto => true
}
