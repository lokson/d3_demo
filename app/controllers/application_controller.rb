class ApplicationController < ActionController::Base
  layout false

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  rescue_from Exception do |exception|
    respond_to do |format|
      format.json { render json: { errors: { flash: [exception.to_s] } }, status: 400 }
      format.html { fail exception }
    end
  end
end
