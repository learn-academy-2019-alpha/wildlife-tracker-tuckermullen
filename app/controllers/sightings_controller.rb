class SightingsController < ApplicationController
    
    def index
        @sightings = Animal.sightings.all
    end
    
    def create
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.create(sighting_params)
        redirect_to @animal
    end
    
    def new
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.create(sighting_params)
    end
    
    def edit
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.find(params[:id])
    end
    
    def update
        @animal = Animal.find(params[:animal_id])
        @sighting = @animal.sightings.find(params[:id])
        
        if @sighting.update_attributes(sighting_params)
            redirect_to @animal
        else
            redirect_to 'edit'
        end
    end
    
    def destroy
        @animal = Animal.find(params[:animal_id])
        @sighting = Sighting.find(params[:id])
        @sighting.destroy
        redirect_to @animal
    end
    
    private
    
    def sighting_params
        params.require(:sighting).permit(:animal_id, :date, :time, :latitude, :longitude)
    end
end
