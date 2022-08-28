class EventsController < ApplicationController
    before_action :authenticate_user!, except: [ :index, :show ]

    def index
        @events = Event.all
        @users = User.all
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = current_user.events.build
    end

    def create
        @event = current_user.events.build(event_params())

        if @event.save
            redirect_to root_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        @event = Event.find(params[:id])
        @event.destroy

        AttendeeAttendedEvent.where(attended_event_id: @event.id).destroy_all

        redirect_to root_path, status: :see_other
    end

    def add_attendee
        @event = Event.find(params[:id])
        @event.attendees << current_user
        redirect_to event_path
    end

    def remove_attendee
        @event = Event.find(params[:id])
        @event.attendees.destroy(current_user)
        redirect_to event_path
    end

    private

    def event_params
        params.require(:event).permit(:name, :date, :location)
    end
end
