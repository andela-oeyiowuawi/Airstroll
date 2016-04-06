FactoryGirl.define do
  factory :airport do
    name "Muritala Muhammed"
    city
    email "mma@nigeria.com"
    phone "0898787656"

    trait :second do
      name "Nnamdi Azikwe"
    end

    trait :third do
      name "Sam Ewang"
    end
  end
end
