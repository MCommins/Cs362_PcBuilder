class CreatesPart

  attr_accessor :name, :part, :compatibility, :account

  def initialize(params)
    @name = params[:name]
    @part = params[:part]
    @compatibility = params[:compatibility]
    @account = Account.find(params[:account].to_i) if params[:account]
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
