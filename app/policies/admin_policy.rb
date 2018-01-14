class AdminPolicy < ApplicationPolicy

  def new?
    user.full_access?
  end

  def edit?
    user.full_access?
  end

  def destroy?
    user.full_access?
  end

  def permitted_attributes
    if user.full_access?
      [:name, :email, :password, :password_confirmation, :role]
    else
      [:name, :email, :password, :password_confirmation]
    end
  end

  class Scope < Scope
    def resolve
      if user.full_access?
        scope.where.not(name: user.name).order(role: :asc, name: :asc)
      else
        scope.where.not(name: user.name).where(role: 1).order(role: :asc, name: :asc)
      end
    end
  end
end
