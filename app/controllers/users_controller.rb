class UsersController < ApplicationController

  # show user with skills you're searching for User.tagged_with("awesome").by_join_date


  # def add_skills_tag
  #   @user.skill_list.add(# "painting", "carving" - where will the tags be set?)
  #   @user.save # save to persist tag_list
  # end

  # def remove_skills_tag
  #   @user.skill_list.remove(#"painting", "carving")
  # end

  # def display_skills
  #   @user.skill_list
  # end

  # def add_links_tag
  #   @user.link_list.add(# "http://www.instagram.com/dada" - where will the tags be set?)
  #   @user.save # save to persist tag_list
  # end

  # def remove_links_tag
  #   @user.link_list.remove(#"painting", "carving")
  # end

  # def display_links
  #   @user.link_list
  # end


  def user_params
    params.require(:user).permit(:name, :tag_list, :avatar, :photos) ## Rails 4 strong params usage
  end
end
