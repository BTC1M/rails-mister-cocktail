class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    # @ingredient = Ingredient.find(params[:ingredient_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    # @dose.ingredient = Ingredient.find(params[:ingredient_id])
    if @dose.save
      redirect_to cocktail_path(@dose.cocktail.id), notice: 'Dose was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose.cocktail, notice: 'Dose was successfully destroyed.'
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
