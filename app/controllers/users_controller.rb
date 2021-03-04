class UsersController < ApplicationController
  
  def user_params
    params.require(:user).permit(:name, :tag_list, :avatar, :photos) ## Rails 4 strong params usage
  end
end
