class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :author
      can [:read, :create], [Fortune, Comment]
      can [:randomFortune], [Fortune, Comment]
      can [:update, :destroy], [Fortune, Comment], :user_id => user.id
    elsif user.has_role? :moderator
      can [:read, :update, :destroy], [Fortune, Comment]
      can [:randomFortune], [Fortune, Comment]
    else
      can :read, [Fortune, Comment]
      can [:randomFortune], [Fortune, Comment]
    end
  end
end
