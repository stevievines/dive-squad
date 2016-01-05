module FormHelper
  MAX_DIVE_COUNT = 11

  def setup_list(list)
    if list.list_dives.any?
      count = MAX_DIVE_COUNT - list.list_dives.count
    else
      count = MAX_DIVE_COUNT
    end
    count.times { list.list_dives.build }
    list
  end
end
