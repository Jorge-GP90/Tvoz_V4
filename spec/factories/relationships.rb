FactoryBot.define do
  factory :relationship do
    follower_id    { FactoryBot.create(:user).id }
    followed_id    { FactoryBot.create(:user02).id }
    follower_id    { FactoryBot.create(:user02).id }
    followed_id    { FactoryBot.create(:user).id }
  end
end