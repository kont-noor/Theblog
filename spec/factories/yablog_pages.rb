FactoryGirl.define do
  factory :page, class: "Yablog::Page" do
    title "MyString"
    slug "MyString"
    description "MyText"
    body "MyText"
  end
end
