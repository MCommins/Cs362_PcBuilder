class CreatesComputer

  def initialize(p)
    @params = {}
    if p[:parts]
      @params[:parts] = p[:parts]
        .map{|part| Part.find_by(id: part)}
        .compact
    else
      @params[:parts] = []
    end
    @params[:account] = Account.find_by(id: p[:account])
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
