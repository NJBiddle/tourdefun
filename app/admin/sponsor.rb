ActiveAdmin.register Sponsor do
  (2010..Date.today.year).each do |year|
    scope year.to_s.to_sym do |sponsors|
      sponsors.for_year(year)
    end
  end

  index do
    column :logo do |sponsor|
      image_tag sponsor.logo_url(:thumb)
    end
    column :name
    column :website
    column :level do |sponsor|
      Sponsor.level_from_index(sponsor.level)
    end
    column :year
    default_actions
  end

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
