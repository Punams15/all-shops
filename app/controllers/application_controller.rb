class ApplicationController < ActionController::Base
  helper_method :current_cart, :current_user, :logged_in?, :admin?

  private

  
  # Cart helper
  
  def current_cart
    @current_cart ||= Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
  end

  
  # User authentication helpers
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def admin?
    current_user&.admin?
  end

  
  # Admin-only access
  
  def require_admin
    unless admin?
      redirect_to root_path, alert: "Access denied"
    end
  end

 
  # Authentication required
 
  def require_login
    unless logged_in?
      redirect_to login_path, alert: "You must log in first"
    end
  end
end

