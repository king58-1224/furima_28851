class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         NAME_REGEX = /\A[ぁ-んァ-ン一-龥]/
         KANA_REGEX = /\A[ァ-ヶー－]+\z/
  validates :nickname, presence: true
  validates :email, presence: true,format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: "Email can't be blank."}
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: "Password can't be blank." }
  validates :first_name, format: { with: NAME_REGEX, message: "First name is invalid. Input full-width characters."}
  validates :first_name_kana, format: { with: KANA_REGEX, message: "First name kana is invalid. Input full-width katakana characters.."}
  validates :family_name, format: { with: NAME_REGEX, message: "Family name is invalid. Input full-width characters."}
  validates :family_name_kana, format: { with: KANA_REGEX, message: "Family name kana is invalid. Input full-width katakana characters."}
  validates :birthday, presence: true
end


