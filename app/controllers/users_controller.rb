class UsersController < ApplicationController
    before_action :authorize, only: [:show]

    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def create
        user = User.create!(user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        user = User.find(session[:user_id])
        render json: user, status: :ok
    end

    # def show
    #     user = User.find(session[:user_id])
    #     if user&.authenticate(params[:password])
    #         render json: user, status: :ok
    #     else
    #         render json: { errors: ["Not authorized"] }, status: :unauthorized
    #     end
    # end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio)
    end

    def render_unprocessable_entity_response(exception)
        render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    end

    def record_not_found
        render json: { error: ["User not found"] }, status: :not_found
    end

    def authorize
        return render json: { errors: ["Not authorized"] }, status: :unauthorized unless session.include? :user_id
    end

end
