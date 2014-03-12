ActiveAdmin.register Page do

  config.filters = false
  actions :all, :except => [:show]

  form partial: 'form'

  index :download_links => false do
    render 'tree'
  end

  controller do
    include TheSortableTreeController::Rebuild
    skip_before_filter :set_page_title

    def index
      @resource = Page.nested_set
    end

    def permitted_params
      params.permit!
    end

    def find_resource
      scoped_collection.friendly.find(params[:id])
    end

  end
end
