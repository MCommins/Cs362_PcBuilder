FactoryBot.define do
  factory :computer do
    name {"a computer"}
    owner {"person"}
    parts {[]}

    trait :owner1 do
      owner {"First Owner"}
    end

    trait :fakeOwner do
      owner {"FAKE OWNER"}
    end
	
	trait :myPC do
      name {"My PC"}
    end
	
	trait :fakePC do
      name {"FAKE PC"}
    end

  end
end