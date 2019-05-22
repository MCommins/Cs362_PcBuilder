require "rails_helper"

RSpec.describe Compare do

  let(:compare) { Compare.new }

  it "compares the parts of a computer to ensure they are compatable" do
    expect(compare.compatable?).to be_a(Integer)
  end

  it "gets data from the SQL Database the returned value is the compatability number" do
    expect(compare.get_data).to be_a(Integer)
  end

end
