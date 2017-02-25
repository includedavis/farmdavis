FactoryGirl.define do
  factory :User do |f|
    f.name "SpongeBob Squarepants"
    f.sequence(:email){|n| "sponge.bob#{n}@krustykrab.org" }
    f.role "standard"
  end
end
