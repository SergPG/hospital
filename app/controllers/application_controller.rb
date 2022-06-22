# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  load_and_authorize_resource unless: :skip_authorize?

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, error: exception.message
  end

  protected

  def skip_authorize?
    devise_controller? || active_admin_resource?
  end

  def active_admin_resource?
    self.class.ancestors.include? ActiveAdmin::BaseController
  end

  def access_denied(exception)
    redirect_to root_url, error: exception.message
  end

  def after_sign_in_path_for(_resource)
    if current_user.admin?
      admin_root_url
    else
      root_url
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name])
  end
end
