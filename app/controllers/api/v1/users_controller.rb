class Api::V1::UsersController < ApplicationController
  before_action :authenticate_user,  only: [:index, :current, :update]
     before_action :authorize_as_admin, only: [:destroy]
     before_action :authorize,          only: [:update]
   def index
     @users = User.all
     render json: @users
   end

  def show
    render json: @user
  end

  def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
  # def create
  #   @user = User.create(user_params)
  #   if @user.valid?
  #     @token = encode_token({user_id: @user.id})
  #     render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
  #   else
  #     render json: { error: 'failed to create user' }, status: :not_acceptable
  #   end


private

def set_user
   @user = User.find(params[:id])
end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end

end
