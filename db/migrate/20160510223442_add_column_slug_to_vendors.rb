class AddColumnSlugToVendors < ActiveRecord::Migration
  def change
    add_column :vendors, :slug, :string
  end
end
