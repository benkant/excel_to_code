require_relative '../../spec_helper.rb'

describe "ExcelFunctions: RAND" do
  
  it "should return something when given appropriate arguments" do
    FunctionTest.rand().should > 0 and FunctionTest.rand().should < 1
  end

  it "should be in the list of functions that can be mapped to ruby" do
    MapFormulaeToRuby::FUNCTIONS[:'RAND'].should == 'rand'
  end
  
end
