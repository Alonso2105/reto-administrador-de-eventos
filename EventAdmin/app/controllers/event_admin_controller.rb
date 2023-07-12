# frozen_string_literal: true

# class EventAdminController
class EventAdminController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      redirect_to events_path, notice: 'Registered Event'
    else
      render :new
    end
  end

  def update
    @event = Event.find(params[:id])

    if params[:event][:remove_image].present? && @event.image.attached?
      @event.image.purge # Eliminar la imagen adjunta
    end
    
    if @event.update(event_params)
      redirect_to events_path, notice: 'Updated event'
    else
      render :edit
    end
  end

  def destroy
    @event = event_find

    if @event.destroy
      redirect_to events_path, notice: 'Deleted event'
    else
      redirect_to events_path, notice: 'Error'
    end
  end

  def delete_image
    @event = Event.find(params[:id])
    @event.image.purge # Elimina la imagen adjunta
    redirect_to edit_event_path(@event), notice: 'Image deleted'
  end


  private

  def event_params
    params.require(:event).permit(:title, :description, :init_date, :cost, :location, :image)
  end

  def event_find
    @event = Event.find(params[:id])
  end
end
