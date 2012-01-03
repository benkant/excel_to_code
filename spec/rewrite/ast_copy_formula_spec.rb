require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe AstCopyFormula do
  
  it "should take a specified distance in rows and columns, and move all references by the appropriate ammount" do
    copy = AstCopyFormula.new
    copy.rows_to_move = 1
    copy.columns_to_move = 1
    copy.copy([:formula,[:cell,'A1']]).should == [:formula,[:cell,'B2']]
    copy.copy([:formula,[:cell,'$A1']]).should == [:formula,[:cell,'$A2']]
    copy.copy([:formula,[:cell,'A$1']]).should == [:formula,[:cell,'B$1']]
    copy.copy([:formula,[:cell,'$A$1']]).should == [:formula,[:cell,'$A$1']]
    copy.copy([:formula,[:area,'A1:Z10']]).should == [:formula,[:area,'B2:AA11']]
    copy.copy([:formula,[:area,'A1:Z10']]).should == [:formula,[:area,'B2:AA11']]
    copy.copy([:formula,[:sheet_reference,'sheet1',[:cell,'A1']]]).should == [:formula,[:sheet_reference,'sheet1',[:cell,'B2']]]
  end
  
end