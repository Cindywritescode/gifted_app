class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy]
  before_action :set_friend, only: [:index, :new, :create, :edit]

  def index
    @events = Event.where(friend: params[:friend_id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.friend = @friend
    @event.user = current_user
    if @event.save
      # EventMailer.notify14(@event).deliver_now
      redirect_to friend_events_path
    else
      render :new
    end
  end

  def edit; end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to friend_events_path
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to friend_events_path
  end

  def all
    @events = Event.where(user: current_user)
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def set_friend
    @friend = Friend.find(params[:friend_id])
  end

  def event_params
    params.require(:event).permit(:event_type, :date)
  end

end
