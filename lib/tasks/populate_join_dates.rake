task populate_join_dates: [:environment] do
  Diver.all.each do |diver|
    diver.update(join_date: diver.created_at)
  end
end
