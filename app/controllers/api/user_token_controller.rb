class Api::UserTokenController < Knock::AuthTokenController
  skip_before_action :verify_authenticity_token


  def create
    auth = auth_token
    if auth
      user_obj = User.find_by(email: params["auth"]["email"])
    render json: {jwt: auth.token, email: user_obj.email, user: user_obj}, status: :created
  end
  end

end
