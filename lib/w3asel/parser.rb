class Parser
  def initialize(error_text)
    @doc = Nokogiri::HTML(error_text)
  end

  def errors
    @errors ||= extract_errors
  end

  private

    def extract_errors
      error_elements.map do |element|
        build_error_from(element)
      end
    end

    def error_elements
      @doc.css('#error_loop .msg_err')
    end

    def build_error_from(error_element)
      line = extract_line_from(error_element)
      col = extract_col_from(error_element)
      msg = extract_msg_from(error_element)
      Error.new(line, col, msg)
    end

    def extract_line_from(error_element)
      location_element_for(error_element).match(/Line (\d*)/)[1].to_i
    end

    def extract_col_from(error_element)
      location_element_for(error_element).match(/Column (\d*)/)[1].to_i
    end

    def location_element_for(error_element)
      error_element.css('em').inner_html
    end

    def extract_msg_from(error_element)
      error_element.css('.msg').inner_html
    end

end
