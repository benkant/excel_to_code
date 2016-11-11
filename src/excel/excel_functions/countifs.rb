module ExcelFunctions

  def countifs(range,*criteria)
    filtered = _filtered_range(range,*criteria)
    count(*filtered)
  end

end
