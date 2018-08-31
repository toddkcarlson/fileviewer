class KmlsController < ApplicationController

   def index
        #$current_session = session[:session_id]
   	  # @kml = Kml.order("created_at").last
        @kml = Kml.where("session = ?", session[:session_id]).order("created_at").last
   end

   def new
       @kml = Kml.new
   end

   def create
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
