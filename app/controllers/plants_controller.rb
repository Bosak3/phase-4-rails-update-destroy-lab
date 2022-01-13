class PlantsController < ApplicationController

  # GET /plants
  def index
    plants = Plant.all
    render json: plants
  end

  # GET /plants/:id
  def show
    plant = find_plants
    render json: plant
  end

  # POST /plants
  def create
    plant = Plant.create(plant_params)
    render json: plant, status: :created
  end

  def update
    plant = find_plants
    if plant
      plant.update(plant_params)
      render json: plant
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  def destroy
    plant = find_plants
    if plant
      plant.destroy
      head :no_content
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
  end

  
  
  
    private

  def plant_params
    params.permit(:name, :image, :price, :is_in_stock)
  end

  def find_plants
    Plant.find_by(id: params[:id])
  end
  
end
