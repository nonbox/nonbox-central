# controller for nonbox companion apps
class V1::CompanionController < ApplicationController
  before_action :permitted_params, only: [:report]

  def tutorials
    @tutorials = Static.tutorials

    render json: @tutorials, status: :ok
  end

  def report
    if ['bugs', 'suggestions'].include? params[:type]
      render plain: 'submitted', status: :ok
    else
      render plain: 'nothing here to see', status: :not_found
    end
  end

  def permitted_params
    params.fetch(:companion, {}).permit(:name, :email, :message)
  end

end
