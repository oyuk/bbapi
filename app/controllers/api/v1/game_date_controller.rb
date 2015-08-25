module Api
  module V1

    class GameDateController < ApplicationController

      def show
        #20150823
        date = params[:date]
        date.insert(4,"-")
        date.insert(7,"-")
        @game_date = GameDate.find_by(game_date: date)
        render "api/v1/game_date/show", :formats => [:json], :handlers => [:jbuilder]
      end
    end

  end
end
