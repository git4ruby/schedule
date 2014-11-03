class HolidayCalendarsController < ApplicationController
 def new
	@holiday_calendar = HolidayCalendar.new
 end

  def create
	holiday_calendar_props = params[:holiday_calendar]
	@holiday_calendar = HolidayCalendar.new(holiday_calendar_props)
	if @holiday_calendar.save
		redirect_to holiday_calendars_path, :notice => "Holiday is Created!"
	else
		render :new
	end
  end

  def index
		@holiday_calendars = HolidayCalendar.order('created_at DESC')
  end

  def edit
		@holiday_calendar = HolidayCalendar.find(params[:id])
  end
  
  def show
		@holiday_calendar = HolidayCalendar.find(params[:id])
		render :layout => 'application'
  end
  def update
		@holiday_calendar = HolidayCalendar.find(params[:id])
		holiday_calendar_props = params[:holiday_calendar]
		if @holiday_calendar.update_attributes(holiday_calendar_props)
			redirect_to holiday_calendar_path(@holiday_calendar), :notice => "Your holiday has been updated!"
		else
			render :edit
		end
  end

  def destroy
	@holiday_calendar = HolidayCalendar.find(params[:id])
	if @holiday_calendar.destroy
		redirect_to holiday_calendars_path, :notice => "Holiday has ben deleted!"
	else
		redirect_to holiday_calendars_path, :notice => "Holiday has not been deleted!"
	end
  end 	


end
