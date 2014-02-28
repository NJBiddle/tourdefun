ActiveAdmin.register Sponsor do

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :website

      f.input :logo, as: :file,
        hint: f.template.image_tag(f.object.logo.url(:thumb))

      f.input :level, as: :select,
        collection: Sponsor.levels_for_select

      f.input :year, as: :select,
        collection: Sponsor.years_for_select,
        selected: Date.today.year
    end

    f.actions
  end

end
