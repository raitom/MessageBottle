class User < ActiveRecord::Base
  attr_accessible :uid, :msg_send

  has_many :messages

  def incrementNbrMess
    self.msg_send += 1
    save!
  end
end
