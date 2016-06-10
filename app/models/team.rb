class Team < ActiveRecord::Base
  has_and_belongs_to_many :coaches
  has_many :divers
  has_many :practices

  def current_month_attendance_to_csv
    practices = self.practices
    headers = ['Diver'].concat(practices.map(&:date))

    CSV.generate do |csv|
      csv << headers
      self.divers.includes(:diver_practices).each do |diver|
        diver_attendance = [diver.name]
        practices.each do |practice|
          diver_practice = diver.diver_practices.find {|dp| dp.practice == practice }
          status = diver_practice.try(:was_present?) ? 'Present' : nil
          diver_attendance << status
        end
        csv << diver_attendance
      end
    end
  end

end
