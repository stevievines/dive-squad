class DiverPractice < ActiveRecord::Base
  belongs_to :practice
  belongs_to :diver

  def was_absent?
    was_present == false
  end
end
