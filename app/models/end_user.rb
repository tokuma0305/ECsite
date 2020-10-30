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
  def active_for_authentication?
    super && (self.is_deleted == false)
  end
  validates :phone_number, presence: true
  has_many :cart_items
  has_many :orders
  has_many :addresses
end
