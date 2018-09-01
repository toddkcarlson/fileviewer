class KmlsController < ApplicationController

   require 'fileutils'

   def index
       @kml = Kml.where("session = ?", session[:session_id]).order("created_at").last
       #Kml.where(session: session[:session_id]).destroy_all
       #@kml = Kml.new
   end

   def new
       @kml = Kml.new
   end

   def create
      FileUtils.rm_rf(Dir['*/uploads/kml/*'])
      Kml.destroy_all

      #@kml = Kml.new(kml_params.merge(expires_at: Time.now + 10.seconds))
      @kml = Kml.new(kml_params)
      @kml.session = session[:session_id]

      if @kml.save
         redirect_to kmls_path, notice: "The kml #{@kml} has been uploaded."
      else
         render "new"
      end     
   end

   def destroy
      @kml = Kml.find(params[:id])
      @kml.destroy
      redirect_to kmls_path, notice:  "The kml #{@kml} has been deleted."
   end
   
   private
   def kml_params
     params.require(:kml).permit(:attachment)
   end

end
