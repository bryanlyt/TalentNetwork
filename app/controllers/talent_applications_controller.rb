class TalentApplicationsController < ApplicationController
  def update
    talent_application = TalentApplication.find(params[:id])
    talent_application.update_attributes(permitted_params)
    UserMailer.talent_application_confirmation(
      talent_application.user,
      talent_application.talent
    ).deliver_now
    redirect_to talent_application.talent
  end

  private

  def permitted_params
    params.require(:talent_application).permit(:chosen)
  end
end
