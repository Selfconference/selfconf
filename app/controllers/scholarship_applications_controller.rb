class ScholarshipApplicationsController < ApplicationController
  def index
  end

  def new
    @scholarship_application = ScholarshipApplication.new(event_id: @event.id)
  end

  def create
    @scholarship_application = ScholarshipApplication.new(allowed_params.merge({event_id: @event.id}))

    if @scholarship_application.save
      redirect_to thanks_scholarship_applications_path
    else
      render :new
    end
  end

  private

  def allowed_params
    permitted = [
      :first_name,
      :last_name,
      :email,
      :location,
      :groups,
      :needs_help_with_tickets,
      :needs_help_with_travel,
      :needs_help_with_other,
      :financial_need_explanation,
      :why_attend,
      :special_accomodations,
    ]
    params.require(:scholarship_application).permit(*permitted)
  end
end
