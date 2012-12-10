require_dependency "ominous/application_controller"

module Ominous
  class WarningsController < ApplicationController
    
    def dismiss
      @warning = Warning.find(params[:id])
      session[:ominous_warnings][@warning.name.to_sym] = :hide
      render :text => "ominous warning #{@warning.name} set to hidden"
    end
    

    
  end
end
