# This migration comes from petrie_engine (originally 20131102233908)
class AddNestedSetFieldsToPages < ActiveRecord::Migration
  def change
    add_column :pages, :lft, :integer
    add_column :pages, :rgt, :integer
    add_column :pages, :parent_id, :integer
    add_column :pages, :depth, :integer
  end
end
