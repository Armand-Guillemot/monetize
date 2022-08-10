class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  has_many :user_socials
  accepts_nested_attributes_for :user_socials
  validates :numero_de_telephone, phone: {possible: true}
end
