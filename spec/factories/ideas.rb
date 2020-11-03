FactoryBot.define do
  factory :idea do
    body { "test" }
    association :category 
  end
end
