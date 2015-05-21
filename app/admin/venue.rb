ActiveAdmin.register Venue do

  index do
    column :name
    column :location
    actions
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :location
    end

    f.actions
  end

  controller do
    def permitted_params
      params.permit!
    end
  end

end
