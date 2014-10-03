class Comment < ActiveRecord::Base
   belongs_to :request

    validates :body, presence:true


end
