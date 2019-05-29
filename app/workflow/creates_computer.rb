class CreatesComputer

  def initialize(p)
    @params = {}
    @params[:parts] = [p[:part_1], p[:part_2], p[:part_3]].compact
    @params[:account] = Account.find(p[:account]) unless p[:account] == ""
    @params[:name] = p[:name]
    @success = false
  end

  def create
    build
    result = @computer.save
    @success = result
  end

  def computer
    @computer
  end

  def success?
    @success
  end

  def build
    @computer = Computer.new(@params)
    @computer
  end

end
