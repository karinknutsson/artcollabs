class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @projects = policy_scope(Project).order(created_at: :desc)
  end
end
