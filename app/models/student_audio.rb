class StudentAudio < ApplicationRecord
  belongs_to :task
  belongs_to :user
  has_one_attached :audio_student
end
