class Goal < ActiveRecord::Base
  belongs_to :diver
  belongs_to :dive

  delegate :display_description, to: :dive
end
