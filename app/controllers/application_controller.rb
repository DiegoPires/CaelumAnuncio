class ApplicationController < ActionController::Base
  protect_from_forgery
  rescue_from CanCan::AccessDenied, with: :sem_autorizacao
  
  private
  def sem_autorizacao
    redirect_to root_url, alert: "Sem autorizacao"
  end
end
