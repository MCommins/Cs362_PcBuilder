class CreatesComputer
  def initialize(params)
    @params = params
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
    @computer.parts = []
    @computer
  end

end
