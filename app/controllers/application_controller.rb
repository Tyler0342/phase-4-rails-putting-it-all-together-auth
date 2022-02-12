class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_422_response

  before_action :authorize_user

  private 

    def render_422_response(e) 
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end  

  # def current_user 
  #   User.find_by(id: session[:current_user]) 
  # end

  def authorize_user
    @current_user = User.find_by(id: session[:user_id])
    render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
  end

end
