class CreatesComputer

  def initialize(p)
    part_1 = p[:part_1]
    part_2 = p[:part_2]
    part_3 = p[:part_3]
    name = p[:name]
    owner = p[:owner]
    account = p[:account]

    @params = {}
    @params[:parts] = [part_1, part_2, part_3]
    if account != ""
      @params[:account] = Account.find(account)
    else
      @params[:account] = nil
    end
    @params[:name] = name
    @params[:owner] = owner
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
