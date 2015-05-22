class ApplicationController < ActionController::Base
  layout false

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end

  rescue_from Exception do |exception|
    render json: { errors: { base: [exception.to_s] } }, status: 400
  end
end
