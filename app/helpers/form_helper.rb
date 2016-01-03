module FormHelper
  def setup_list(list)
    11.times { list.list_dives.build }
    list
  end
end
