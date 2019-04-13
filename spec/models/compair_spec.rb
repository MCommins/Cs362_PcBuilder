require "rails_helper"

RSpec.describe Compair do 

  let(:compair) { Compair.new }

  it "compairs the parts of a computer to ensure they are compatable" do 
    expect(compair.compatable?).to be_a(Integer)
  end

  it "gets data from the SQL Database the returned value is the compatability number" do
    expect(compair.get_data).to be_a(Integer)
  end

end