class ContactsController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    puts params_contact.inspect
    @contact = Contact.new(params_contact)
    
    if @contact.save
      ContactsMailer.contact_message(@contact).deliver
      redirect_to root_path
    else
      render :new
    end
  end
  
  private
   def params_contact
    params.require(:contact).permit(:email, :message, :subject)
   end

end
