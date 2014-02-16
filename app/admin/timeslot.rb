ActiveAdmin.register Timeslot do

  controller do
    def permitted_params
        params.permit!
      end
  end

  form do |f|
    f.inputs "Basic" do
      f.input :start, as: :datetime_picker
      f.input :end, as: :datetime_picker
      f.input :hangup
    end

    f.inputs "Details" do
      f.input :artists
      f.input :venue_id, as: :select, collection: Venue.all
    end

    f.actions
  end

end
