class Coach < ActiveRecord::Base
  has_secure_password
  has_and_belongs_to_many :teams
  has_many :divers, through: :teams
end
