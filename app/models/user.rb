class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items
  has_many  :orders

  with_options presence: true do
    validates :nickname
    validates :birthday
    validates :first_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'でないと登録できません' }
    validates :last_name, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'でないと登録できません' }
    validates :first_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'でないと登録できません' }
    validates :last_name_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'でないと登録できません' }

    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, presence: true, with: PASSWORD_REGEX, message: 'でないと登録できません'

    # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
    # validates :email, { presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false } }
  end
end
