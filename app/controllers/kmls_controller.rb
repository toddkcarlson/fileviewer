class KmlsController < ApplicationController
   def index
      if @kml.present?
   	    @kml = Kml.first
      end
   end

   def new
       @kml = Kml.new
   end

   def create
      @kml = Kml.new(kml_params)
      # @kml.name =  @kml

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
