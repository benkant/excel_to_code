module ExcelFunctions
  
  def countif(check_range, criteria, count_range=check_range)
    countifs(count_range,check_range,criteria)
  end
  
end
