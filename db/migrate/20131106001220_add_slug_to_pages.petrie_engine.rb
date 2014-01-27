# This migration comes from petrie_engine (originally 20131102232947)
class AddSlugToPages < ActiveRecord::Migration
  def change
    add_column :pages, :slug, :string
  end
end
