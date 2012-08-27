require File.dirname(__FILE__) + "/../spec_helper"

describe "Checking a local file for errors" do
  it "The application checks a file with no errors and reports that it is all good" do
    output = run_with_test_file("valid.xhtml")
    output.strip.should == "Syntax OK"
  end
end

