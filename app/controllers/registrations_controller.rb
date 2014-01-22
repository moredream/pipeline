class RegistrationsController < Devise::RegistrationsController



  def create
    super
    # resource.build_profile
    # resource.save!
  end

end
