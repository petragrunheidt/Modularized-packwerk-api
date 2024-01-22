# frozen_string_literal: true

class RcUser < ApplicationRecord
  extend Devise::Models
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :email, :role, presence: true
  validates :email, uniqueness: true

  belongs_to :recycling_company

  enum role: { unauthorized: 0, admin: 10 }
end
