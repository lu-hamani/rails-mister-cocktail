class DosesController < ApplicationController
  before_action :set_cocktail

  def new
    @dose = Dose.new
    @ingredients = Ingredient.all
  end

  def create
    @dose = Dose.new(description: dose_params[:description])
    @dose.cocktail = @cocktail
    @ingredient = Ingredient.find(dose_params[:ingredient].to_i)
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    id = @dose.cocktail_id
    @dose.destroy
    redirect_to cocktail_path(id)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end
end
