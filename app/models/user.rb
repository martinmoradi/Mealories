class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  validates_presence_of :firstname, :lastname
  validates             :email, uniqueness: true

  has_many :recipes
  has_many :days
  has_many :menus
end
