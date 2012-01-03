class StepsController < ApplicationController
  load_and_authorize_resource

  def update
    @step.update_attributes(params[:step])
    redirect_to edit_kit_path(@step.kit)
  end

  def create
    Step.create(params[:step])
    redirect_to edit_kit_path(@step.kit)
  end
end
