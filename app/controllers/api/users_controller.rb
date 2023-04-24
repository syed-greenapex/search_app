class Api::UsersController < ApplicationController

    # POST /users
    def create
        @users = User.new(user_params)

        if @users.save
            render json: @users, status: :created
        else
            render json: @users.errors, status: :unprocessable_entity
        end
    end

    # GET /users
    def index
        @users = User.all
        # binding.pry
        render json: @users, status: :ok
    end

    # GET /users
    def show
        # binding.pry
        @users = User.find_by(id: params[:id])
        render json: @users, status: :ok
    end

    # GET api/typehead/:query
    def typehead
        query = params[:query]
        @users = User.or(
            {firstname: /#{query}/i},
            {lastname: /#{query}/i},
            {email: /#{query}/i}
        )
        render json: @users, status: :ok
    end

    private

    def user_params
        params.require(:user).permit(:firstname, :lastname, :email)
    end
end
