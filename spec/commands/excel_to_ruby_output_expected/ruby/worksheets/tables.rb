# coding: utf-8
# Tables

require_relative '../examplespreadsheet'

module ExampleSpreadsheet
class Tables < Spreadsheet
  def a1; @a1 ||= referencing.c4; end

end
end
