task populate_attendance_data_from_csv: [:environment] do
  CSV.foreach("attendance.csv", headers: true) do |row|
    diver_attendance = row.to_hash
    if diver = Diver.find_by(name: diver_attendance.delete("Diver"))
      diver_attendance.each do |date, attendance|
        if practice = Practice.find_by(date: date)
          unless diver.diver_practices.find_by(practice_id: practice.id)
            diver.diver_practices.create(was_present: attendance.present?, practice: practice)
          end
        end
      end
    end
  end
end
