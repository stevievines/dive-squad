task remove_pre_joined_diving_practices: [:environment] do
  DiverPractice.includes(:practice, :diver).all.each do |diver_practice|
    if diver_practice.practice.nil?
      diver_practice.destroy
    elsif diver_practice.practice.date < diver_practice.diver.join_date
      diver_practice.destroy
    end
  end
end
