require File.dirname(__FILE__) + "/../spec_helper"

describe Parser do
  describe "#errors" do
    it "returns Error objects representing the errors in the given result file from validator.w3.org" do
      parser = Parser.new(open(output_test_file_path('one_error.xhtml')))
      errors = parser.errors
      errors.size.should == 1
      errors.first.col.should == 12
      errors.first.line.should == 9
      errors.first.msg.should == 'end tag for "html" omitted, but OMITTAG NO was specified'
    end
  end
end
