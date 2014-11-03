class ShiftsController < ApplicationController

	def new
		@shift = Shift.new
		@shift.user = current_user
	end
	
	def create
		shift_props = params[:shift]
		@shift = Shift.new(shift_props)
		if @shift.save
			redirect_to shifts_path, :notice => "Shift is created"
		else

		render :new
		end
	end
	
	def index
	#	@shifts = Shift.order('created_at DESC')
		@shifts = current_user.shifts	
	end
	
	def show
		@shift = Shift.find(params[:id])
		render :layout => 'application'
	end
	
	def update
		@shift = Shift.find(params[:id])
		shift_props = params[:shift]
		if @shift.update_attributes(shift_props)
			redirect_to shift_path(@shift), :notice => "Your Shift has been updated!"
		else
			
			render :edit
		end
	end

	def edit
		@shift = Shift.find(params[:id])
	end

	def destroy
		@shift = Shift.find(params[:id])
		if @shift.destroy
			redirect_to shifts_path, :notice => "Shift has been deleted!"
		else
			redirect_to shifts_path, :notice => "Shift is not deleted!"
		end
	end

end
