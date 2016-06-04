class Goal < ActiveRecord::Base
  belongs_to :dive

  delegate :display_description, to: :dive

  validates_uniqueness_of :dive
end
