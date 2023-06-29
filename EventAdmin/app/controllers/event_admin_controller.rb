class EventAdminController < ApplicationController
  def index
    @event_list = Event.all
  end


end
