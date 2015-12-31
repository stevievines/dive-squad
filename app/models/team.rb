class Team < ActiveRecord::Base
  has_and_belongs_to_many :coaches
  has_many :divers
end
