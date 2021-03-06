class TripsController < ApplicationController
  before_action :authenticate_user!
  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.users << current_user
    if @trip.save
      create_itineraries(@trip)
      redirect_to trip_url(@trip.id)
    else
      render new_trip_path
      flash[:notice] = 'Woops. We\'ve had some problems with saving your trip.'
    end
  end

  def destroy
    tripId = params[:id]
    @trip = Trip.find(params[:id])
    usertrip = UserTrip.where(trip_id: @trip)

    usertrip.each do |indTrip|
      if indTrip.user_id === current_user.id
        @trip.destroy!
      else
        flash[:notice] = 'Woops. Looks like you do not own that itinerary.'
      end
    end

    if @trip.destroy
      redirect_back fallback_location: user_trips_path(current_user.id)
    else
      flash[:notice] = 'Woops. Looks like we couldn\'t delete your trip.'
    end

  end

  def index
    @user = User.find params[:user_id]
    @trips = @user.trips
    @trip = Trip.new
  end


  def show
    @trip = Trip.includes(itineraries: :itinerary_items).find params[:id]
    @itinerary_item = ItineraryItem.new
    @selected_itinerary = @trip.itineraries.find_by(id: params[:selected_itinerary_id])
    @selected_itinerary ||= @trip.itineraries.first
    @invite = Invite.new
    respond_to do |format|
      format.cable { render layout: false }
    end
  end

  private

  def create_itineraries(trip)
    (trip.start_date..trip.end_date).each do |date|
      Itinerary.create(
        name: "Day #{trip.itineraries.count + 1}",
        date: date,
        notes: "",
        trip_id: trip.id,
        public: false,
        featured: false
      )
    end
  end

  def trip_params
    params.require(:trip).permit(
      :name,
      :start_date,
      :end_date,
      :public
    )
  end

end
