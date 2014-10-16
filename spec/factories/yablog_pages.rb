# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :page, class: "Yablog::Page" do
    title "MyString"
    slug "MyString"
    description "MyText"
    body "MyText"
  end
end
