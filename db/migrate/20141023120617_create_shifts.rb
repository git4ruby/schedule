class CreateShifts < ActiveRecord::Migration
  def up
       	create_table :shifts do |t|


		t.string :name
		t.date :shift_date
		t.timestamps 
	end
  end

  def down

		drop_table :shifts
  end
end
