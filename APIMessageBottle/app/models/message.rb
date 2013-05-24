class Message < ActiveRecord::Base
  attr_accessible :texte, :user_id

  belongs_to :user

end
