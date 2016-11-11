require_relative '../../spec_helper.rb'

describe "ExcelFunctions: COUNTIF" do

  it "should only count values in the area that meet the criteria" do
    FunctionTest.countif(10,10.0).should == 1
    FunctionTest.countif(10,10.0,20).should == 1
    FunctionTest.countif([[10],[100],[nil]],10.0).should == 1
    FunctionTest.countif([[10,100,nil]],10.0).should == 1
    FunctionTest.countif([["pear"],["bear"],["apple"]],'Bear',[[10],[100],[nil]]).should == 1
  end
  
  it "should understand >0 type criteria" do
    FunctionTest.countif([[10],[100],[nil]],">0").should == 2
    FunctionTest.countif([[10],[100],[nil]],">10").should == 1
    FunctionTest.countif([[10],[100],[nil]],"<100").should == 1
  end

  it "should match numbers with strings that contain numbers" do
    FunctionTest.countif(10,"10.0").should == 1
  end
    
  it "should treat nil as an empty string when in the check_range, but not in the criteria" do
    FunctionTest.countif(nil,0,20).should == 0
    FunctionTest.countif(0,nil,100).should == 1
    FunctionTest.countif(nil,nil, 100).should == 0
  end
  
  it "should deal with errors in arguments" do
    FunctionTest.countif(:error1,10,20).should == 0
    FunctionTest.countif(10,20,:error1).should == 0
    #FunctionTest.countif(20,20,:error1).should == :error1
    FunctionTest.countif(1,:error2,20).should == 0
  end

  #it "should count number of cells matching exact string criterion a" do
  #  FunctionTest.countif('a', 'a').should == 1
  #end

  #it "should count number of cells matching exact string criterion" do
  #  a = ['apples', 'oranges', 'peaches', 'apples']
  #  FunctionTest.countif(a, "apples").should == 2
  #end

  #it "should count number of cells matching gt equality criterion" do
  #  b = [32, 54, 75, 86]
  #  FunctionTest.countif(b, ">55").should == 2
  #end
 
  # it "should count number of cells matching ne equality criterion" do
  #  b = [32, 54, 75, 86]
  #  FunctionTest.countif(b, "<>75").should == 2
  #end
 
  # it "Counts the number of cells containing any text in cells" do
  #  a = ['apples', 'oranges', 'peaches', 'apples']
  #  FunctionTest.countif(a, "*").should == 4
  #end
 
  # it "Counts the number of cells that have exactly 7 characters that end with the letters 'es' in cells" do
  #  a = ['apples', 'oranges', 'peaches', 'apples']
  #  FunctionTest.countif(a, "?????es").should == 2
  #end
  #  
  #it "should treat nil as zero" do
  #  FunctionTest.countif('apples', nil).should == 0
  #end
  #
  #it "should return an error if an argument is an error" do
  #  FunctionTest.countif(:error, '*').should == :error
  #end
 
  #it "should count scalar values" do
  #  FunctionTest.countif('apples', '*').should == 1
  #end
  
  it "should be in the list of functions that can be mapped to ruby" do
    MapFormulaeToRuby::FUNCTIONS[:'COUNTIF'].should == 'countif'
  end
  
end
