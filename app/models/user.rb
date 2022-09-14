class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :validatable, :trackable

  has_many :user_socials
  accepts_nested_attributes_for :user_socials
  has_many :user_products
  accepts_nested_attributes_for :user_products
  validates :numero_de_telephone, phone: {possible: true}


  def has_user_product(product)
    self.user_products.present? && self.user_products.where(product_id: product.id).present?
  end

  def user_product(product)
    self.user_products.where(product_id: product.id).first if self.user_products.present? && self.user_products.where(product_id: product.id).present?
  end

  def calendly_url
    phone = Phonelib.parse(self.numero_de_telephone).international
    email = self.email
    name = self.pseudo
    return "https://calendly.com/rdv_monetizee/finalisation?hide_gdpr_banner=1&primary_color=11abed&name=#{name}&email=#{email}&a1=#{phone}"
  end

end
