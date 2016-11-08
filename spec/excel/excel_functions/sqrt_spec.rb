require_relative '../../spec_helper.rb'

describe "ExcelFunctions: SQRT" do
  
  it "should return positive sqrt 16" do
    FunctionTest.sqrt(16).should == 4
  end

  it "should return positive sqrt 1" do
    FunctionTest.sqrt(1).should == 1
  end

  it "should return positive sqrt 1" do
    FunctionTest.sqrt(2).should > 1.414 and FunctionTest.sqrt(2).should < 1.415
  end

  it "should return an error for negatives" do
    FunctionTest.sqrt(-16).should == :error
  end
    
  it "should treat nil as zero" do
    FunctionTest.sqrt(nil).should == 0
  end
  
  it "should return an error if an argument is an error" do
    FunctionTest.sqrt(:error).should == :error
  end
  
  it "should be in the list of functions that can be mapped to ruby" do
    MapFormulaeToRuby::FUNCTIONS[:'SQRT'].should == 'sqrt'
  end
  
end
