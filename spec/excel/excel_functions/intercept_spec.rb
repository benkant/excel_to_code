require_relative '../../spec_helper.rb'

describe "ExcelFunctions: INTERCEPT" do
  
  it "should return something when given appropriate arguments" do
    FunctionTest.intercept([2,3,9,1,8],[6,5,11,7,5]).should be_within(0.0000005).of(0.0483871)
  end

  it "should return something when given appropriate arguments 2" do
    FunctionTest.intercept([[2,3],[9,1,8]],[[6,5],[11,7,5]]).should be_within(0.0000005).of(0.0483871)
  end

  it "should return an error when given inappropriate arguments" do
    FunctionTest.intercept("Asdasddf").should == :error
  end
 
  it "should return an error when given inappropriate arguments redux" do
    FunctionTest.intercept(1,2).should == :error
  end

  it "should return an error when given inappropriate arguments redux 2" do
    FunctionTest.intercept([1,2],[3,3]).should == :value
  end

  it "should return an error when given different sized arrays" do
    FunctionTest.intercept([1,2],[3,3,4]).should == :error
  end


  it "should return an error if an argument is an error" do
    FunctionTest.intercept(:error).should == :error
  end
  
  it "should be in the list of functions that can be mapped to ruby" do
    MapFormulaeToRuby::FUNCTIONS[:'INTERCEPT'].should == 'intercept'
  end
  
end
