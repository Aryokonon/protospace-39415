class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
    @comments = @user.comments
    @user_owns_profile = (user_signed_in? && current_user == @user)
  end
end