class Goal < ActiveRecord::Base
  belongs_to :diver
  belongs_to :dive
end
