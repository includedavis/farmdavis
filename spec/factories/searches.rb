FactoryGirl.define do
  factory :Search do
    min_date "2017-05-01"
    max_date "2017-05-01"
    crop "MyString"
    harvested_from "MyString"
    donated_to "MyString"
    min_quantity "9.99"
    max_quantity "9.99"
  end
end
