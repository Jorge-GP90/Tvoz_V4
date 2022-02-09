class UsersController < ApplicationController
  # before_action :authenticate_user!
  before_action :set_user, only: %i[show]

  def show
    @users = User.select(:id, :name, :email, :admin, :role, :avatar).order(created_at: :DESC)
    @tasks = Task.select(:id, :title, :content, :image, :audio_record, :audio, :created_at, :user_id).order(created_at: :DESC)
  end

  def profile
    if @user.id == current_user.id || current_user.admin?
      @tasks = current_user.tasks.select(:id, :title, :content, :image, :audio_record, :audio, :created_at).order(created_at: :DESC)
    else
      redirect_to tasks_path
    end
  end

  def private_message

  end
  
  def community
    @users = User.select(:id, :name, :email, :admin, :role).order(created_at: :DESC)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :avatar, :role, :admin, :task_id, :follower_id, :followed_id, :created_at)
  end

  def set_user
    # user = User.all.pluck(:id)
    @user = User.find(params[:id])
    # @user = User.find_by(id: params[:id]) if params[:id].in?(user)
  end
end
