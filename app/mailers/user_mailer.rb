class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.contact_email.subject
  #

  def welcome_email(user_email)
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def contact_email(email, name, question, phone, to, newsletter, notifications, selected_product)

    @email = email
    @name = name
    @question = question
    @phone = phone
    @contact_method = to
    @newsletter = newsletter
    @notifications = notifications
    @selected_product = selected_product

    mail from: @email,
         to: '23706821+ge022@users.noreply.github.com',
         bcc: '23706821+ge022@users.noreply.github.com',
         subject: "Contact request from #{@name} at Brisk!"

  end

  def article_email user, article
    @user = user
    @article = article

    mail to: user.email,
         subject: @article.title
  end


  def restaurant_email(user, restaurant)
    @user = user
    @restaurant = restaurant

    mail to: user.email,
         subject: 'New restaurant now open!'
  end

end
