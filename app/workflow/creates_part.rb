class CreatesPart

  attr_accessor :name, :part, :compatibility, :account

  def initialize(name: "", part: "", compatibility: "", account: "")
    @name = name
    @part = part
    @compatibility = compatibility
    @account = Account.first
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
    self.part = Part.new(name: name, part: part, compatibility: compatibility, account: account)
    part
  end
end
