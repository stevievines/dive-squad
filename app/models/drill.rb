class Drill < ActiveRecord::Base
  belongs_to :skill

  validates :name, presence: true
end
