class UserPolicy < ApplicationPolicy
  def home?
    true
  end

  def users?
    check_for_admin
  end

  def assessments?
    check_for_admin
  end
  
  def user?
    check_for_admin
  end

  def update_role?
    user != record && check_for_admin
  end

  def can_edit?
    user == record
  end

  def check_for_admin
    user.admin?
  end
end
