FactoryBot.define do
  factory :tweet do
    title {"タイトル"}
    image {File.open("#{Rails.root}/app/assets/images/sample.jpeg")}
    category_id {1}
  end
end
