# frozen_string_literal: true

# class EventAdminController
class EventAdminController < ApplicationController
  def index
    @events = Event.all
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to event_path, notice: 'Evento Registrado'
    else
      render new
    end
  end

  def destroy
    @event = event_find

    if @event.destroy
      redirect_to events_path, notice: 'Evento Eliminado'
    else
      redirect_to events_path, notice: 'Error'
    end
  end

  private

  def event_params
    params.permit(:title, :description, :init_date, :cost, :location)
  end

  def event_find
    @event = Event.find(params[:id])
  end
end
