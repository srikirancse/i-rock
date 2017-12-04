FactoryBot.define do
  factory :achievement do
    title 'Title'
    description 'Description'
    featured false
    cover_image 'some_file.png'

    factory :public_achievement do
      privacy :public_access
    end

    factory :private_achievement do
      privacy :private_access
    end
    factory :public_with_id_achievement do
      user_id 1
      privacy :public_access
    end
  end
end
