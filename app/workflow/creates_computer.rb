class CreatesComputer
  def initialize(params)
    @params = params
    if params[:account] != ""
      @params[:account] = Account.find(params[:account])
    else
      @params[:account] = nil
    end
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
