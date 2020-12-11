class Contact < ApplicationRecord

  validates :email, 
            presence: true,
            format: { 
              with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
              message: "L'adresse email n'est pas correcte."
            }
  
validates :message, presence: true

end
