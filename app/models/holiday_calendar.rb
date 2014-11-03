class HolidayCalendar < ActiveRecord::Base
   attr_accessible :holiday_date, :holiday_reason


	validates :holiday_date, uniqueness: true,presence:true
	validates :holiday_reason, presence:true


end
