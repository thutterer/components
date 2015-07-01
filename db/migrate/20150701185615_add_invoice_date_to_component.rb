class AddInvoiceDateToComponent < ActiveRecord::Migration
  def change
    add_column :components, :invoice, :date
  end
end
