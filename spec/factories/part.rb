FactoryBot.define do
  factory :part do
    name {"fake"}
    part {"part"}
    compatibility {1}

    trait :compatibility2 do
      compatibility {2}
    end

    trait :compatibility3 do
      compatibility {3}
    end

    trait :part1 do
      part {"part1"}
    end

    trait :part2 do 
      part {"part2"}
    end

    trait :part3 do 
      part {"part3"}
    end

    trait :amd do
      name {"amd"}
    end

    trait :asus do
      name {"asus"}
    end

    trait :gygabite do 
      name {"gygabite"}
    end

  end

end
