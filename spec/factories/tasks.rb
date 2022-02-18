FactoryBot.define do
  factory :task do
    title { 'title 1 ' }
    audio { '' }
    image { '' }
    audio_record { '' }
    association :user
  end
  factory :second_task, class: Task do
    title { 'title 2 ' }
    audio { '' }
    image { '' }
    audio_record { '' }
    association :user
  end
  
end