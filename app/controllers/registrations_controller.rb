class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Registrations are only for immediate family members at this time'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Registrations are only for immediate family members at this time'
    redirect_to root_path
  end
end