class CollectionPointsController < ApplicationController
  before_action :set_collection_point, only: %i[show edit update destroy]

  # GET /collection_points or /collection_points.json
  def index
    @collection_points = CollectionPoint.all
  end

  # GET /collection_points/1 or /collection_points/1.json
  def show; end

  # GET /collection_points/new
  def new
    @collection_point = CollectionPoint.new
    @recyclable_materials = RecyclableMaterial.all
  end

  # GET /collection_points/1/edit
  def edit
    @recyclable_materials = RecyclableMaterial.all
  end

  # POST /collection_points or /collection_points.json
  def create
    @collection_point = CollectionPoint.new(collection_point_params)

    respond_to do |format|
      if @collection_point.save
        format.html do
          redirect_to collection_point_url(@collection_point), notice: 'Collection point was successfully created.'
        end
        format.json { render :show, status: :created, location: @collection_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /collection_points/1 or /collection_points/1.json
  def update
    respond_to do |format|
      if @collection_point.update(collection_point_params)
        format.html do
          redirect_to collection_point_url(@collection_point), notice: 'Collection point was successfully updated.'
        end
        format.json { render :show, status: :ok, location: @collection_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collection_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collection_points/1 or /collection_points/1.json
  def destroy
    @collection_point.destroy

    respond_to do |format|
      format.html { redirect_to collection_points_url, notice: 'Collection point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_collection_point
    @collection_point = CollectionPoint.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def collection_point_params
    params.require(:collection_point).permit(:name, :address, :latitude, :longitude, :contact, :website,
                                             recyclable_material_ids: [])
  end
end
