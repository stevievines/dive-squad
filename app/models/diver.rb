class Diver < ActiveRecord::Base
  belongs_to :team
  has_many :coaches, through: :team
end
