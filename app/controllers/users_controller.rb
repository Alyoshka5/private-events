class UsersController < ApplicationController

    def show
        @events = Event.all.where(creator_id: params[:id])
        @user = User.find(params[:id])
    end
end
