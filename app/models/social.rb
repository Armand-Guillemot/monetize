class Social < ApplicationRecord
  has_many :user_socials

  def to_s
    ""
  end
end
