require_relative '../../spec_helper.rb'

describe "ExcelFunctions: AVERAGEIFS" do
  
  it "should only average values that meet all of the criteria" do
    FunctionTest.averageifs([[10],[100],[nil]],[[10],[100],[nil]],10.0,[["pear"],["bear"],["apple"]],'Bear').should == :div0
    FunctionTest.averageifs([[10],[100],[nil]],[[10],[100],[nil]],10.0,[["pear"],["bear"],["apple"]],'Pear').should == 10.0
  end

  it "should work when single cells are given where ranges expected" do
    FunctionTest.averageifs(0.143897265452564, "CAR", "CAR", "FCV", "FCV").should == 0.143897265452564
  end

  it "should match numbers with strings that contain numbers" do
    FunctionTest.averageifs(100,10,"10.0").should == 100
    FunctionTest.averageifs([[1],[2],[3],[4],[5],[5]],[["CO2"],["CH4"],["N2O"],["CH4"],["N2O"],["CO2"]],"CO2",[["1A"],["1A"],["1A"],[4],[4],[5]],2).should == :div0 
  end
    
  it "should treat nil as an empty string when in the check_range, but not in the criteria" do
    FunctionTest.averageifs(100,nil,20).should == :div0
    FunctionTest.averageifs(100,nil,"").should == 100
    FunctionTest.averageifs(100,nil,nil).should == :div0 
  end
  
  it "should deal with errors" do
    FunctionTest.averageifs(:error1,10,20).should == :div0
    FunctionTest.averageifs(:error1,20,20).should == :error1
    FunctionTest.averageifs(1,:error2,20).should == :div0
    FunctionTest.averageifs(1,10,:error3).should == :div0
    FunctionTest.averageifs(1,:error1,:error1).should == 1
  end
  
  it "should be in the list of functions that can be mapped to ruby" do
    MapFormulaeToRuby::FUNCTIONS[:'AVERAGEIFS'].should == 'averageifs'
  end
  
end
