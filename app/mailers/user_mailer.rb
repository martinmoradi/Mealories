class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: 'Bienvenue chez Mealories !')
  end

  def shopping_list_email(user)
    @user = user
    @plan = Plan.find(user.current_plan_id)
    mail(to: @user.email, subject: "Liste de course")
  end
end
