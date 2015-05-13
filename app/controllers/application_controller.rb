class ApplicationController < ActionController::Base
  # todo: delete or change to :null_session
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  # skip_before_filter :verify_authenticity_token

  layout false

  rescue_from ActiveRecord::RecordNotFound do
    respond_to do |type|
      type.all { render nothing: true, status: 404 }
    end
  end

  # todo: move to initializer
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
end
