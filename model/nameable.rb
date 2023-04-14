class Nameable
  def correctName
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

end

class baseDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable.new
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitalizeDecorator < baseDecorator
  def correct_name
    (@nameable.correct_name).capitalize()
  end
end

class TrimmerDecorator < baseDecorator
  def correct_name
    (@nameable.correct_name).truncate(10)
  end
end
