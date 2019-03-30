class Letter
  attr_writer :letter, :left_time
  def initialize(attributes = {})
    @letter = attributes[:letter]
    @left_time = attributes[:left_time]
  end
end
