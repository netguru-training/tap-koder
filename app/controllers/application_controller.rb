class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  expose(:resource) { User.new }
  expose(:devise_mapping) { Devise.mappings[:user] }
  expose(:resource_name) { :user }
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end


end
