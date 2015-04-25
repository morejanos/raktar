class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:    

    user ||= User.new # guest user (not logged in)

    if user.admin?
      can :manage, :all
    elsif user.poweruser?
      can :read, Component
      can :create, Component
      can :update, Component
      can :destroy, Component
      can :kivet, Component
    
      can :read, Componenttype
      can :create, Componenttype
      can :update, Componenttype
      can :destroy, Componenttype

      can :read, Packaging
      can :create, Packaging
      can :update, Packaging
      can :destroy, Packaging

      can :read, Manufacturer
      can :create, Manufacturer
      can :update, Manufacturer
      can :destroy, Manufacturer

    elsif user.worker?
      can :read, Component
      can :kivet, Component

      can :read, Componenttype
      can :update, Componenttype
      can :create, Componenttype

      can :read, Packaging
      can :update, Packaging
      can :create, Packaging

      can :read, Manufacturer
      can :update, Manufacturer
    end
 
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
