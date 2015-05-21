ActiveAdmin.register Timeslot do
  config.filters = false

  (2013..Date.today.year).to_a.reverse.each do |year|
    scope(year.to_s) { |scope|
      scope.where(start: Date.new(year).beginning_of_year..Date.new(year).end_of_year)
    }
  end

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
    actions
  end

  form do |f|
    f.inputs "Basic" do
      f.input :start, as: :just_datetime_picker
      f.input :end, as: :just_datetime_picker
      f.input :description, input_html: {
        rows: 3
      }
      f.input :published
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
