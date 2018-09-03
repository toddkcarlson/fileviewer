class KmlsController < ApplicationController

   require 'fileutils'

   def index
       @kml = Kml.where("session = ?", session[:session_id]).order("created_at").last
   end

   def new
       @kml = Kml.new
   end

   def create
      FileUtils.rm_rf(Dir['*/uploads/kml/*'])
      Kml.destroy_all

      @kml = Kml.new(kml_params)
      @kml.session = session[:session_id]

      if @kml.save
         redirect_to kmls_path, notice: "The kml #{@kml} has been uploaded."
      else
         render "new"
      end     
   end
   
   private
   def kml_params
     params.require(:kml).permit(:attachment)
   end

end