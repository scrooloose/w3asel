class Error
  attr_reader :line, :col, :msg

  def initialize(line, col, msg)
    @line = line
    @col = col
    @msg = msg
  end
end
