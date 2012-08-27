require_lib_file("validator")

describe Validator do
  describe "#warnings_or_errors?" do
    it "returns false if the subject file is valid" do
      v = Validator.new(test_file_path("valid.xhtml"))
      v.warnings_or_errors?.should == false
    end

    it "returns true if the subject file has warnings or errors"
  end

end
