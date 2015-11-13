class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    # CAN create new Project
    can [:new, :create], Project

    # CAN manage Project if it was created by the User
    can :manage, Project, creator: user

    # CAN apply for Talent
    can :apply, Talent

    # CANNOT apply for Talent if Project was created by the User
    cannot :apply, Talent, project: { creator: user }

    # CANNOT apply for Talent if User has already applied
    cannot :apply, Talent do |talent|
      talent.users.include?(user)
    end

    # CAN create new Talent positions if User has created a Project
    can [:new, :create], Talent if user.created_projects.any?

    # CAN update Talent positions if User is the creator
    can :update, Talent, project: { creator: user }, active: true

    # CAN show index / single User page
    can [:show, :index], User
  end
end
