class User < ApplicationRecord

  def self.create_new_user(auth)
    create! do |user|
      user.uid = auth['uid']
      if auth['info']
        user.first_name = auth['info']['name'] || ""
        user.last_name = auth[]
      end
    end
  end

end
