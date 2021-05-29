class EventsController < ApplicationController
  before_action :set_event, only: [:show]
  
  def index
    # Not sure if this is correct yet, maybe Events should be nested in friends?
    @events = Event.where(friend: params[:friend_id])
  end

  def show; end

  def new
    @event = Event.new
  end

  def create; end

  private

  def set_event
    @event = Event.find(params[:id])
  end
end
