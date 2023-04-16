class RecyclableMaterialsController < ApplicationController
  before_action :set_recyclable_material, only: %i[ show edit update destroy ]

  # GET /recyclable_materials or /recyclable_materials.json
  def index
    @recyclable_materials = RecyclableMaterial.all
  end

  # GET /recyclable_materials/1 or /recyclable_materials/1.json
  def show
  end

  # GET /recyclable_materials/new
  def new
    @recyclable_material = RecyclableMaterial.new
  end

  # GET /recyclable_materials/1/edit
  def edit
  end

  # POST /recyclable_materials or /recyclable_materials.json
  def create
    @recyclable_material = RecyclableMaterial.new(recyclable_material_params)

    respond_to do |format|
      if @recyclable_material.save
        format.html { redirect_to recyclable_material_url(@recyclable_material), notice: "Recyclable material was successfully created." }
        format.json { render :show, status: :created, location: @recyclable_material }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recyclable_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recyclable_materials/1 or /recyclable_materials/1.json
  def update
    respond_to do |format|
      if @recyclable_material.update(recyclable_material_params)
        format.html { redirect_to recyclable_material_url(@recyclable_material), notice: "Recyclable material was successfully updated." }
        format.json { render :show, status: :ok, location: @recyclable_material }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recyclable_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recyclable_materials/1 or /recyclable_materials/1.json
  def destroy
    @recyclable_material.destroy

    respond_to do |format|
      format.html { redirect_to recyclable_materials_url, notice: "Recyclable material was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recyclable_material
      @recyclable_material = RecyclableMaterial.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recyclable_material_params
      params.require(:recyclable_material).permit(:name, :description, :category)
    end
end
