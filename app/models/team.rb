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
          dpra = diver.diver_practices.find {|dp| dp.practice == practice }
          status = if dpra.present?
                     dpra.was_present? ? 'Present' : nil
                   else
                     nil
                   end
          diver_attendance << status
        end
        csv << diver_attendance
      end
    end
  end

end
