class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    can [:new, :create], Project
    can :manage, Project, creator: user

    can :apply, Talent
    cannot :apply, Talent, project: { creator: user }
    cannot :apply, Talent do |talent|
      talent.users.include?(user)
    end
    can [:new, :create], Talent if user.created_projects.any?
    can :update, Talent, project: { creator: user }, active: true

    can :show, User
  end
end
