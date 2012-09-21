class W3aselApp
  def initialize(args)
    validate_and_extract_args!(args)
  rescue ArgumentError => e
    puts "#{e.message}\n\n#{usage_string}"
    abort
  end

  def run
    if parser.errors.any?
      print_errors(parser.errors)
    else
      puts "Syntax OK"
    end
  end

  private


    def validate_and_extract_args!(args)
      raise(ArgumentError, "Invalid number of args") if args.length != 1

      @filename = args.first
      raise(ArgumentError, "File doesnt exist: '#{@filename}'") unless File.exists?(@filename)
    end

    def usage_string
      result  = "Usage:\n"
      result += "  w3scraper [filename]"
    end

    def parser
      @parser ||= Parser.new(output_from_w3_validator)
    end

    def output_from_w3_validator
      W3Site.new(@filename).results
    end

    def print_errors(errors)
      errors.each do |error|
        puts "Error: line #{error.line}, column #{error.col}: #{error.msg}\n"
      end
    end
end
