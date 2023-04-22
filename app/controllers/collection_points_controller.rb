class CollectionPointsController < ApplicationController
  before_action :set_collection_point, only: %i[show edit update destroy]

  def index
    @collection_points = CollectionPoint.all
  end

  def show; end

  def new
    @collection_point = CollectionPoint.new
    @recyclable_materials = RecyclableMaterial.all
  end

  def edit
    @recyclable_materials = RecyclableMaterial.all
  end

  def create
    @collection_point = CollectionPoint.new(collection_point_params)

    respond_to do |format|
      if @collection_point.save
        format.html { redirect_to collection_points_url, notice: 'Collection point was successfully created.' }
        format.json { render :show, status: :created, location: @collection_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @collection_point.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @collection_point.update(collection_point_params)
        format.html { redirect_to collection_points_url, notice: 'Collection point was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @collection_point.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @collection_point.destroy

    respond_to do |format|
      format.html { redirect_to collection_points_url, notice: 'Collection point was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Método para pesquisar pontos de coleta com base em uma consulta de nome ou material reciclável
  def search
    query = params[:query].strip.downcase
    @collection_points = CollectionPoint.joins(:recyclable_materials)
                                        .where('lower(collection_points.name) LIKE :query OR lower(recyclable_materials.name) LIKE :query', query: "%#{query}%")
                                        .distinct
    render json: @collection_points.as_json(include: :recyclable_materials)
  end

  # Método responsável por buscar os pontos de coleta próximos à localização informada pelo usuário
  def nearby
    lat = params[:latitude].to_f
    lng = params[:longitude].to_f
    radius = 10 * 1000 # 10 km de raio

    @collection_points = CollectionPoint.select('*')
                                        .from("collection_points, (SELECT '#{lat}'::float AS lat, '#{lng}'::float AS lng) AS user_location")
                                        .where("earth_distance(ll_to_earth(collection_points.latitude, collection_points.longitude), ll_to_earth(user_location.lat, user_location.lng)) <= #{radius}")
                                        .includes(:recyclable_materials)

    render json: @collection_points.as_json(include: :recyclable_materials)
  end

  private

  def set_collection_point
    @collection_point = CollectionPoint.find(params[:id])
  end

  def collection_point_params
    params.require(:collection_point).permit(:name, :address, :latitude, :longitude, :contact, :website,
                                             recyclable_material_ids: [])
  end
end
