FactoryGirl.define do
  factory :Donation do |f|
    f.date "2017-02-22"
    f.crop "corn"
    f.quantity "5"
  end

  factory :InvalidDonation1, class: "Donation" do |f|
  	f.date "2017-02-22"
  	f.crop "rice"
  	f.quantity nil
  end

  factory :InvalidDonation2, class: "Donation" do |f|
  	f.date "2017-02-22"
  	f.crop ""
  	f.quantity 3
  end
end
