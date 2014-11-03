class CreateHolidayCalendars < ActiveRecord::Migration
  def up
    create_table :holiday_calendars do |t|
      t.date :holiday_date
      t.string :holiday_reason
      t.timestamps
    end
  end

  def down
		drop_table :holiday_calendars
  end
end
