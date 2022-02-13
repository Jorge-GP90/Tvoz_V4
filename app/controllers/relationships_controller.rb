class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user


  def create
    @user = User.find(params[:user_id])
    current_user.follow(@user)
    respond_to do |format|
      format.js { render :follow }
      format.html { redirect_to community_url }
    end
    # if @user.follower_user.include?(current_user)
    #   Relationship.find_by(followed_id: params[:id]).update(status: true)
    # redirect_to :back 
  end

  def destroy
    @user = Relationship.find_by(followed_id: params[:id]).followed
    current_user.unfollow(@user)
    respond_to do |format|
      format.js { render :unfollow }
      format.html { redirect_to community_url }
    end
    # redirect_to :back 
  end
  

  def self.connect(followed)
    user = User.find(followed.user_id)
    if user.follower_user.include?(current_user)
    current_user.follow(@user)
    end
    respond_to do |format|
      format.js { render :connect }
      format.html { redirect_to community_url }
    end
  end
  
  # private
  # def find_user
  #   @user = User.find(params[:relationship][:user_id])  
  # end
end
