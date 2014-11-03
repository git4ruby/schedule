class Shift < ActiveRecord::Base
  attr_accessible :name, :shift_date, :user_id
	
	belongs_to :user
#	validates :name, presence: true
	validates :shift_date, presence: true
	validate :shift_date_cannot_be_past	
	validate :shift_date_cannot_be_holiday
	def shift_date_cannot_be_past
		if shift_date.present? && shift_date < Date.today
			errors.add(:shift_date, "Date already passed!")
		end
	end
	
	def shift_date_cannot_be_holiday
		holiday = HolidayCalendar.where("holiday_date = ?", shift_date)
                if holiday.present? 
			errors.add(:holiday, "Holiday cannont be the shift date!")
		end
	end 

end
