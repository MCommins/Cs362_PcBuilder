require 'rails_helper'

RSpec.describe Account, type: :model do
  describe "account unit tests" do
    it "can be instaniated" do
      account = Account.new
    end
  end
end
