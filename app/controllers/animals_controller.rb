class AnimalsController < ApplicationController
    
    def index
       @animals = Animal.all.order("created_at DESC") 
    end
    
    def new
        @animal = Animal.new
    end
    
    def create
        @animal = Animal.new(animal_params)
        
        if @animal.save
            flash[:notice] = "Animal has been created."
            redirect_to @animal
        else
            render action: :new
        end
    end
    
    def update
        @animal = Animal.find(params[:id])
        
        if @animal.update(animal_params)
            redirect_to root_path
        else
            render 'edit'
        end
    end
    
    def edit
        @animal = Animal.find(params[:id])
    end
    
    def show
        @animal = Animal.find(params[:id])
    end
    
    def destroy
        @animal = Animal.find(params[:id])
        @animal.destroy
       
       redirect_to root_path
    end
    
    private
    
    def animal_params
        params.require(:animal).permit(:name, :latin_name, :kingdom)
    end
end
