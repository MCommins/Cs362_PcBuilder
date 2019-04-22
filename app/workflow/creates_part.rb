class CreatesPart

  attr_accessor :name, :part, :compatability

  def initialize(name: "", part: "", compatability: "")
    @name = name
    @part = part
    @compatability = compatability
    @success = true
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
    self.part = Part.new(name: name, part: part, compatability: compatability)
    part
  end
end