class RestaurantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      # scope.where(user: user)
      scope.all
    end
  end

  def show?
    true
  end

  def edit?
    update?
  end

  def update?
    # if current_user == @restaurant.user
    # if user == record.user
    #   true
    # else
    #   false
    # end
    user == record.user || user.admin
  end

  def create?
    true
  end

  def new?
    create?
  end

  def destroy?
    user == record.user || user.admin
  end
end
