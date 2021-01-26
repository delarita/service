class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :epilations
  has_many :maquillages
  has_many :massages
  has_many :soinvisages

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
