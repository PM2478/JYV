class Trend < ApplicationRecord
   
        index = 1
        while index <= 3
           render '/components/trend'
         index += 1 %>
        <end 
        
        #default_scope { order(cached_votes_score: :DESC) }

end
