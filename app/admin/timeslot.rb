ActiveAdmin.register Timeslot do

  controller do
    def permitted_params
      params.permit!
    end
  end

  index do
    column :start
    column :end
    column :venue
    column :artists do |timeslot|
      timeslot.artists.map { |a| a.name }.to_sentence
    end
    column :description
    default_actions
  end

  form do |f|
    f.inputs "Basic" do
      f.input :start, as: :just_datetime_picker
      f.input :end, as: :just_datetime_picker
      f.input :description, input_html: {
        rows: 3
      }
    end

    f.inputs "Details" do
      f.input :artists
      f.input :venue_id, as: :select, collection: Venue.all,
              :input_html => {
                :class => 'select2'
              }
    end

    f.actions
  end

end
