class Api::V1::SessionsController < Devise::SessionsController
  
  def create
    user = User.find_by(email: params[:email])
    
    if user&.valid_password?(params[:password])
      session[:user_id] = user.id
      render status: :created, json: { data: user }
    else
      render status: :bad_request, json: { data: "User validations fail" }
    end
  end
  
  private

end