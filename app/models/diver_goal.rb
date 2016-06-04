class DiverGoal < ActiveRecord::Base
  belongs_to :diver
  belongs_to :goal

  validates_uniqueness_of :goal, scope: :diver
end
