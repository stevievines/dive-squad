class Diver < ActiveRecord::Base
  belongs_to :team
  has_many :coaches, through: :team
  has_many :lists, dependent: :destroy
end
