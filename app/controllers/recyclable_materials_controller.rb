class RecyclableMaterialsController < ApplicationController
  before_action :set_recyclable_material, only: %i[show edit update destroy]

  def index
    @recyclable_materials = RecyclableMaterial.all
  end

  def show; end

  def new
    @recyclable_material = RecyclableMaterial.new
  end

  def edit; end

  def create
    @recyclable_material = RecyclableMaterial.new(recyclable_material_params)

    respond_to do |format|
      if @recyclable_material.save
        format.html do
          redirect_to recyclable_materials_url,
                      notice: 'Recyclable material was successfully created.'
        end
        format.json { render :show, status: :created, location: @recyclable_material }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recyclable_material.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recyclable_material.update(recyclable_material_params)
        format.html do
          redirect_to recyclable_materials_url,
                      notice: 'Recyclable material was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @recyclable_material }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recyclable_material.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recyclable_material.destroy

    respond_to do |format|
      format.html { redirect_to recyclable_materials_url, notice: 'Recyclable material was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_recyclable_material
    @recyclable_material = RecyclableMaterial.find(params[:id])
  end

  def recyclable_material_params
    params.require(:recyclable_material).permit(:name, :description, :category)
  end
end