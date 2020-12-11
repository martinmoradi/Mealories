class ContactsMailer < ApplicationMailer

  def contact_message(contact)
    @contact = contact
    mail( :to => "mealories@gmail.com", :subject => "Tu as reçu un email de l'application !")
  end

end
