class Api::V1::RegistrationsController < Devise::RegistrationsController
  # respond_to :json
    def create
      @user = User.create(user_params)
      if @user.save!
        render json: @user.as_json(only: [:id, :email]), status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :name, :password, :password_confirmation)
    end
end