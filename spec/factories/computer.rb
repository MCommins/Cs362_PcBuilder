FactoryBot.define do
  factory :computer do
    name {"a computer"}
    account { Account.new }
    parts {[]}

    trait :owner1 do
      account { Account.new(name: "First") }
    end

    trait :fakeOwner do
      account { Account.new(name: "FAKE") }
    end
	
	trait :myPC do
      name {"My PC"}
    end
	
	trait :fakePC do
      name {"FAKE PC"}
    end

  end
end
