class RegisteredSitesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_registered_site, only: [:show, :edit, :update, :destroy]
  def index
    @registered_sites = current_user.registered_sites
  end

  # GET /registered_sites/1
  # GET /registered_sites/1.json
  def show
  end

  # GET /registered_sites/new
  def new
    @registered_site = current_user.registered_sites.new
  end

  # GET /registered_sites/1/edit
  def edit
  end

  # POST /registered_sites
  # POST /registered_sites.json
  def create
    @registered_site = current_user.registered_sites.new(registered_site_params)

    respond_to do |format|
      if @registered_site.save
        format.html { redirect_to @registered_site, notice: 'Registered site was successfully created.' }
        format.json { render :show, status: :created, location: @registered_site }
      else
        format.html { render :new }
        format.json { render json: @registered_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registered_sites/1
  # PATCH/PUT /registered_sites/1.json
  def update
    respond_to do |format|
      if @registered_site.update(registered_site_params)
        format.html { redirect_to @registered_site, notice: 'Registered site was successfully updated.' }
        format.json { render :show, status: :no_content, location: @registered_site }
      else
        format.html { render :edit }
        format.json { render json: @registered_site.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registered_sites/1
  # DELETE /registered_sites/1.json
  def destroy
    @registered_site.destroy
    respond_to do |format|
      format.html { redirect_to registered_sites_url, notice: 'Registered site was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_registered_site
      @registered_site = current_user.registered_sites.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white registered_site through.
    def registered_site_params
      params.require(:registered_site).permit(:site_url)
    end

end