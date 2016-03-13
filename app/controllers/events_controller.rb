class EventsController < ApplicationController
  before_action :log_in_user, only: [:new, :create]

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
    @attendees = @event.attendees
  end

  def index
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end
  
  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "Event successfully created!"
      redirect_to current_user
    else
      flash.now[:danger] = "The event could not be saved."
      render :new
    end 
  end
  
  private
    def event_params
      params.require(:event).permit(:name, :location, :date)
    end
    
    def log_in_user
      unless logged_in?
        flash[:danger] = "Please log in"
        redirect_to login_path
      end
    end
end
