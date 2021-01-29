# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/voucher
  def voucher
    user = User.first
    UserMailer.with(user: user).voucher
  end

end
