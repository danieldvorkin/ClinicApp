class PageController < ApplicationController
  def home
    if current_user
      authorize current_user
      @users = User.all
      @assessments = Assessment.all
    else
      redirect_to new_user_session_path
    end
  end

  def users
    @users = authorize User.all
  end

  def user
    @user = authorize User.find params[:uuid]
  end

  def update_role
    user = User.find params[:uuid]
    user.admin = params[:update_role][:role] == "Admin"
    user.save

    redirect_to request.referrer
  end
end
