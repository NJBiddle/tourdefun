ActiveAdmin.register Timeslot do

	controller do
 		def permitted_params
     	 	params.permit!
    	end
	end

	form do |f|
		f.inputs "Basic" do
			f.input :start
			f.input :end
			f.input :hangup
		end

		f.inputs "Details" do
			f.input :artists
      f.input :venue, as: :select, collection: Venue.all
    end

		f.actions
	end

end
