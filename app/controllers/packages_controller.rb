class PackagesController < ApplicationController
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  # GET /packages
  # GET /packages.json
  def index
    @packages = Package.all
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
    @package.courier_name = Courier.find(@package.courier_id).name
  end

  # GET /packages/new
  def new
    # courier_id = params[:format]
    # permited_params = package_params
    # permited_params[:courier_id] = courier_id
    @package = Package.new

    # @options = Courier.find(:all, 
    # :order => "name, email").
    # collect do |s|
    #     [s.tracking_number, s.id]
    # end
    
  end

  # GET /packages/1/edit
  def edit
  end

  # POST /packages
  # POST /packages.json
  def create
    courier_id = params[:format]
    permited_params = package_params
    permited_params[:courier_id] = courier_id
    @package = Package.new(package_params)
    # @options = Courier.find(:all, 
    # :order => "name, email").
    # collect do |s|
    #     [s.tracking_number, s.id]
    # end
    
    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def package_params
      params.require(:package).permit(:tracking_number, :delivery_status, :courier_id)
    end
end
