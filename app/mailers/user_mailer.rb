class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.voucher.subject
  #
  def voucher(order)
    @order = order
    @user = params[:user] # Instance variable => available in view
    mail(to: @user.email, subject: 'Votre bon cadeau Relook Esthétique')
  end
end
