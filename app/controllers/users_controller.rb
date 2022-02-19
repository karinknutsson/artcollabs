class UsersController < ApplicationController
  def index
    if params[:interest].present?
        @users = policy_scope(User.tagged_with(params[:interest]))
      elsif params[:skill].present?
        @users = policy_scope(User.tagged_with(params[:skill]))
      else
        @users = policy_scope(User).order(created_at: :desc)
      end
  end

  def user_params
    params.require(:user).permit(:name, :avatar, :photos, :skill_list, :interest_list)
  end
end
