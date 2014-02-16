ActiveAdmin.register Artist do

  controller do
    def permitted_params
      params.permit!
    end
  end

  form do |f|
    f.inputs "Details" do
      f.input :name
      f.input :website
    end

    f.actions
  end

end
