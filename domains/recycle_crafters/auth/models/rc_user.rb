# frozen_string_literal: true

class RcUser < ActiveRecord::Base
  extend Devise::Models
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  include DeviseTokenAuth::Concerns::User

  belongs_to :recycling_company
end
