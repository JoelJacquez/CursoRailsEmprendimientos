class Api::V1::EntrepreneursController < Api::V1::MasterApiController
  before_action :authenticate_user!
  before_action :set_entrepreneur,
  only: [:show, :update, :destroy]

  def index
    @entrepreneurs = current_user.entrepreneurs
    render :json => {entrepreneurs: @entrepreneurs}
  end

  def show
    render :json => {entrepreneur: @entrepreneur}
  end

  # POST /api/v1/entrepreneurs
  # POST /api/v1/entrepreneurs.json
  def create
    # @entrepreneur = Entrepreneur.new(entrepreneur_params)
    @entrepreneur = current_user.entrepreneurs.new(entrepreneur_params)
    if @entrepreneur.save
      render :json => {entrepreneur: @entrepreneur}, status: :created
    else
      render :json => { errors: @entrepreneur.errors}, status: :unprocessable_entity
    end

  end

  # PATCH/PUT /api/v1/entrepreneurs/1
  # PATCH/PUT /api/v1/entrepreneurs/1.json
  def update
    if @entrepreneur.update(entrepreneur_params)
      render :json => {entrepreneur: @entrepreneur}, status: :ok
    else
      render :json => { errors: @entrepreneur.errors}, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/entrepreneurs/1
  # DELETE /api/v1/entrepreneurs/1.json
  def destroy
    @entrepreneur.destroy
    respond_to do |format|
      format.html { redirect_to entrepreneurs_url, notice: 'Entrepreneur was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_entrepreneur
    @entrepreneur = Entrepreneur.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def entrepreneur_params
    params.require(:entrepreneur).permit(:title, :description, :image_1, :image_2, :image_3, :image_4)
  end
end
