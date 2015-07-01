class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    alias_action :create, :read, :update, :to => :nodelete
    user ||= User.new # guest user (not logged in)
    if user.role.name == "Admin"
      can :manage, :all
    elsif user.role.name == "Systembetreuer"
      can :nodelete, :all
    else
      can :read, :all
    end
  end
end
