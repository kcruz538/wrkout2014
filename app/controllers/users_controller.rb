class UsersController < ApplicationController
  def create
    @user = User.new(params.require(:user).permit(:email, :password, :password_confirmation))
    if @user.save
      sign_in @user
    end

  end

  def show

    @user = User.find(params[:id])

    @albums = Album.where(user_id: @user.id)

  end


end
