class AddMsgSendToUser < ActiveRecord::Migration
  def change
    add_column :users, :msg_send, :integer
  end
end
