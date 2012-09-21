require File.dirname(__FILE__) + "/../spec_helper"

describe W3Site do
  describe "#results" do
    it "raises an APIError if the w3 validator cant be contacted" do
      HTTParty.should_receive(:post).and_raise(SocketError)

      w = W3Site.new(test_file_path("one_error.xhtml"))

      lambda {
        w.results
      }.should raise_error(W3Site::APIError)
    end
  end
end
