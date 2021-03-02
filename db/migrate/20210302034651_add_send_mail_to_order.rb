class AddSendMailToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :email_sent, :boolean, default: false
  end
end
