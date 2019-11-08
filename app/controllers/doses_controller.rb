class DosesController < ApplicationController
  before_action :set_dose, only: [:edit, :update, :destroy]

  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # from url directly
    @cocktail = Cocktail.find(params[:cocktail_id])
    # From form "dose"
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def edit
  end

  def update
    @dose.update(dose_params)
    redirect_to cocktail_path(@dose.cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
