class TrendsController < ApplicationController
   
    def index
        @trend = Trend.all
    end
end
#order(cached_votes_score: :DESC) 