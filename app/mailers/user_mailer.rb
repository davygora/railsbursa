class UserMailer < ApplicationMailer

  def petition_accepted(petition)
    @petition = petition
    @user = User.find(@petition.user.id)
    mail to: @user.email, subject: 'Петиция принята к рассмотрению'
  end

  def petition_rejected(petition)
    @petition = petition
    @user = User.find(@petition.user.id)
    mail to: @user.email, subject: 'Петиция отклонена'
  end

  def email_to_admin(petition)
    @petition = petition
    mail to: "admin@mail.com", subject: 'Петиция к рассмотрению'
  end

end
