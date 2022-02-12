class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user


  def create
    @user = User.find(params[:id])
    current_user.follow(@user)
    redirect_to :back 
  end

  def destroy
    @user = Relationship.find_by(followed_id: params[:id]).followed
    current_user.unfollow(@user)
    redirect_to :back 
  end
  
  def connected?(user)
    @user = Relationship.find_by(followed_id: params[:id]).followed
    current_user.connected(@user)
    redirect_to :back 
  end
  
  private
  def find_user
    @user = User.find(params[:user_id])  
  end
end
