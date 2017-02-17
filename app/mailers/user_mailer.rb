class UserMailer < ApplicationMailer

  def welcome_email(user, order)
    @user = user
    @order = order
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: "subject is #{@order.id} ")
  end
end
