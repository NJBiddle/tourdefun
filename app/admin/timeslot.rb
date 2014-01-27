ActiveAdmin.register Timeslot do
	
	controller do
 		def permitted_params
     	 	params.permit!
    	end
	end

	form do |f|
		f.inputs "Details" do
			f.input :start
			f.input :end
			f.input :hangup
		end

		f.inputs "Artists" do
			f.input :artists
		end


		f.actions
	end

end