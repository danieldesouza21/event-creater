class EventsController < ApplicationController
  def index
    matching_events = Event.all

    @list_of_events = matching_events.order({ :created_at => :desc })

    render({ :template => "events/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_events = Event.where({ :id => the_id })

    @the_event = matching_events.at(0)

    render({ :template => "events/show.html.erb" })
  end

  def create
    the_event = Event.new
    the_event.title = params.fetch("query_title")
    the_event.date_time = params.fetch("query_date_time")
    the_event.location = params.fetch("query_location")
    the_event.duration = params.fetch("query_duration")
    the_event.owner_id = params.fetch("query_owner_id")
    the_event.description = params.fetch("query_description")
    the_event.image = params.fetch("query_image")

    if the_event.valid?
      the_event.save
      redirect_to("/events", { :notice => "Event created successfully." })
    else
      redirect_to("/events", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.title = params.fetch("query_title")
    the_event.date_time = params.fetch("query_date_time")
    the_event.location = params.fetch("query_location")
    the_event.duration = params.fetch("query_duration")
    the_event.owner_id = params.fetch("query_owner_id")
    the_event.description = params.fetch("query_description")
    the_event.image = params.fetch("query_image")

    if the_event.valid?
      the_event.save
      redirect_to("/events/#{the_event.id}", { :notice => "Event updated successfully."} )
    else
      redirect_to("/events/#{the_event.id}", { :alert => the_event.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_event = Event.where({ :id => the_id }).at(0)

    the_event.destroy

    redirect_to("/events", { :notice => "Event deleted successfully."} )
  end
end
