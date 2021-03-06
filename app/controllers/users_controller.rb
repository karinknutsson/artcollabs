class UsersController < ApplicationController

  def index
    @users = policy_scope(User).tagged_with(params['interests'])
  end

  def user_params
    params.require(:user).permit(:name, :tag_list, :avatar, :photos, :skill_list, :interest_list) ## Rails 4 strong params usage
  end
end
