# frozen_string_literal: true

# class EventAdminController
class EventAdminController < ApplicationController
  # @events = Event.where(user_id: current_user.id)
  def index
    @events = Event.where(user_id: current_user.id)
  end

  def public_events
    @events = Event.where(public: true)
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

     # Eliminar la imagen adjunta
    @event.image.purge if params.dig(:event, :remove_image).present? && @event.image.attached?
    
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
    params.require(:event).permit(:title, :description, :init_date, :cost, :location, :image, :public).merge(user_id: current_user.id)
  end

  def event_find
    @event = Event.find(params[:id])
  end
end
