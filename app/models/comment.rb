class Comment < ActiveRecord::Base
   belongs_to :request
   belongs_to :user
   validates :body, presence:true, length:{maximum: 200}
end
