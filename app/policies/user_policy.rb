class UserPolicy < ApplicationPolicy
  def home?
    true
  end

  def users?
    user.admin?
  end

  def user?
    user.admin?
  end

  def update_role?
    user != record && user.admin?
  end

  def assessments?
    user.admin?
  end

  def can_edit?
    user == record
  end
end
