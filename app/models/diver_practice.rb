class DiverPractice < ActiveRecord::Base
  belongs_to :practice
  belongs_to :diver

  def was_absent?
    was_present == false
  end

  def display_name
    if was_present
      "Present"
    elsif excused_absence
      "Excused"
    else
      "Absent"
    end
  end
end
