ActionMailer::Base.smtp_settings = {
  address: "in-v3.mailjet.com",
  port: 25,
  domain: 'mailjet.com',
  user_name: ENV['MAILJET_ADDRESS'],
  password: ENV['MAILJET_PASSWORD'],
  authentication: :login,
  enable_starttls_auto: true
}
