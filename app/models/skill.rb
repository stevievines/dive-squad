class Skill < ActiveRecord::Base
  belongs_to :fundamental

  validates :fundamental, presence: true
end
