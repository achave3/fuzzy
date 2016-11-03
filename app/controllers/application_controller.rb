class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
#protected methods and private methods are similar, they can only be run by another
#part of the app. Your body: you can wave (a method), you can digest food (a method)
#digesting food however is not *conciously* demanded (unconcious)- this is what 'protected' is

def configure_permitted_parameters
  
  devise_parameter_sanitizer.permit(:sign_up) {|u| u.permit({roles:[]}, :email, :password, :password_confirmation, :name, :username,:bio, :location)}
  #this is a security feature bc hackers try to do dirty dirty things
  
  #or format it this way for better read
  devise_parameter_sanitizer.permit(:account_update) {|u| 
    u.permit(:email, 
             :password, 
             :password_confirmation, 
             :current_password, 
             :name, 
             :username, 
             :bio, 
             :location)
  }
  
end
end
