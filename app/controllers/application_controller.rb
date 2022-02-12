class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :render_422_response

  before_action :authorize_user

  private 

    def render_422_response(errors) 
    render json: { errors: errors.record.errors.full_messages }, status: :unprocessable_entity
  end  

  # def current_user 
  #   User.find_by(id: session[:current_user]) 
  # end

  def authorize_user
    @current_user = User.find_by(id: session[:user_id])
    return render json: { errors: ["Not authorized"] }, status: :unauthorized unless @current_user #session.include? :user_id
  end

end
