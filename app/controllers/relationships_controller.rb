class RelationshipsController < ApplicationController

  def show
    @relationship = Relationship.find(params[:id])
  end

  def create
    @relationship = Relationship.new(user_id: current_user.id, friend_id: params[:friend_id])
    @relationship.save
    redirect_to user_path (@relationship.friend_id), notice: "Successfully Follow"
  end

  def destroy
    @relationship = Relationship.where(:user_id => params[:user_id], :friend_id => params[:friend_id]).first
    @relationship.delete
    redirect_to root_path, notice: "Successfully Unfollow"
  end

end
