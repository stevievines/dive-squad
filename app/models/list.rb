class List < ActiveRecord::Base
  belongs_to :diver
  has_many :list_dives
  has_many :dives, through: :list_dives
end
