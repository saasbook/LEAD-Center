class User < ApplicationRecord
  serialize :ethnicity, Array

  def self.create_new_user(auth)
    create! do |user|
      user.uid = auth['uid']
      if auth['info']
        user.first_name = auth['info']['name'] || ""
        user.last_name = auth['info']['last_name'] || ""
        user.email = auth['info']["email"] || ""
      end
    end
  end

end
