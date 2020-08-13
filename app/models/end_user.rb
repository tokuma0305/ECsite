class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :katakana_lastname, presence: true
  validates :katakana_firstname, presence: true
  validates :lastname, presence: true
  validates :firstname, presence: true
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
end
