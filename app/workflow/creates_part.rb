class CreatesPart

  attr_accessor :name, :part, :compatibility

  def initialize(name: "", part: "", compatibility: "")
    @name = name
    @part = part
    @compatibility = compatibility
    @success = false
  end

  def create 
    build
    result = part.save
    @success = result
  end
  def success?
    @success
  end

  def build
    self.part = Part.new(name: name, part: part, compatibility: compatibility)
    part
  end
end
