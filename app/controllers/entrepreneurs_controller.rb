class EntrepreneursController < ApplicationController
  before_action :authenticate_user!
  before_action :set_entrepreneur, only: [:show, :edit, :update, :destroy]

  # GET /entrepreneurs
  # GET /entrepreneurs.json
  def index
    @entrepreneurs = current_user.entrepreneurs
  end

  # GET /entrepreneurs/1
  # GET /entrepreneurs/1.json
  def show
  end

  # GET /entrepreneurs/new
  def new
    @entrepreneur = Entrepreneur.new
  end

  # GET /entrepreneurs/1/edit
  def edit
  end

  # POST /entrepreneurs
  # POST /entrepreneurs.json
  def create
    # @entrepreneur = Entrepreneur.new(entrepreneur_params)
    @entrepreneur = current_user.entrepreneurs.new(entrepreneur_params)

    respond_to do |format|
      if @entrepreneur.save
        format.html { redirect_to @entrepreneur, notice: 'Entrepreneur was successfully created.' }
        format.json { render :show, status: :created, location: @entrepreneur }
      else
        format.html { render :new }
        format.json { render json: @entrepreneur.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entrepreneurs/1
  # PATCH/PUT /entrepreneurs/1.json
  def update
    respond_to do |format|
      if @entrepreneur.update(entrepreneur_params)
        format.html { redirect_to @entrepreneur, notice: 'Entrepreneur was successfully updated.' }
        format.json { render :show, status: :ok, location: @entrepreneur }
      else
        format.html { render :edit }
        format.json { render json: @entrepreneur.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entrepreneurs/1
  # DELETE /entrepreneurs/1.json
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
