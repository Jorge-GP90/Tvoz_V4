class User < ApplicationRecord
  validates :name, presence: true, length: { maximum: 50 }
  has_many :tasks, dependent: :destroy
  has_many :follower, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy
  has_many :followed, class_name: 'Relationship', foreign_key: 'followed_id', dependent: :destroy
  has_many :following_user, through: :follower, source: :followed
  has_many :follower_user, through: :followed, source: :follower

  require './app/roles/role'
  enum role: Role.options_for_enum
 
  # after_initialize :set_default_role, :if => :new_record?
  # def set_default_role
  #   self.role ||= :student
  # end
   
  # after_update :ensure_teacher
  # after_destroy :ensure_teacher
  
  # def ensure_teacher
  #   if User.where(role: :teacher)? || User.where(admin: true).count.zero?
  #     raise "This account cannot be deleted"
  #   end
  # end
  
  # enum role: [:student, :teacher]
  # after_initialize :set_default_role, :if => :new_record?
  # def set_default_role
  #   self.role = 0 if role.nil?
  # end
  
  # after_initialize :set_defaults

  # private
  # def set_defaults
  #   self.role = 0 if role.nil?
  # end

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
