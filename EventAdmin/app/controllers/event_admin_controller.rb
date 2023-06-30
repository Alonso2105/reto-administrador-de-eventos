# frozen_string_literal: true

# class EventAdminController
class EventAdminController < ApplicationController
  def index
    @event_list = Event.all
  end

  def create
    @event = Event.new(event_param)

    if @event.save
      redirect_to event_path, notice: 'evento guardado'
    else
      render new
    end
  end

  def destroy
    @event = event_find

    if @event.destroy
      redirect_to events_path, notice: 'Usuario Eliminado'
    else
      redirect_to events_path, notice: 'Error'
    end
  end

  private

  def event_param
    params.permit(:title, :description, :init_date, :cost, :location)
  end

  def event_find
    @event = Event.find(params[:id])
  end
end
