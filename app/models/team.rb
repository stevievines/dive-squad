class Team < ActiveRecord::Base
  has_and_belongs_to_many :coaches
  has_many :divers
  has_many :practices
  has_many :practice_schedules
end
