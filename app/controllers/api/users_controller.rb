module Api
  class UsersController < ApplicationController
    def create
      user = User.new(user_params)
      if user.save
        render json: { status: :created, user: user }
      else
        render json: { status: 422, errors: user.errors.full_messages }
      end
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  end
end