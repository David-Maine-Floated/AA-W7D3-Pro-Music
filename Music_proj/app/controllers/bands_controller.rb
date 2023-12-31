class BandsController <ApplicationController

    def index 
        @bands = Band.all
        render :index 
    end

    def new 
        @band = Band.new 
        render :new
    end

    def create 
        @band = Band.new(band_params)
        if @band.save 
            redirect_to bands_url 
        else  
            flash.now[:errors] = @band.errors.full_messages
            render :new 
        end 
    end

    def show 
        @band = Band.find(params[:id])
        render :show 
    end 

    # def destroy 
    #     @band = Band.find_by(parms[:band][:name])
    #     @band.destroy 
    #     redirect_to bands_url 
    # end




private 

    def band_params
        params.require(:band).permit(:name)
    end 
end 