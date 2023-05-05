class ApplistsController < ApplicationController
  before_action :set_applist, only: %i[ show edit update destroy ]

  # GET /applists or /applists.json
  def index
    @applists = Applist.all
  end

  # GET /applists/1 or /applists/1.json
  def show
  end

  # GET /applists/new
  def new
    @applist = Applist.new
  end

  # GET /applists/1/edit
  def edit
  end

  # POST /applists or /applists.json
  def create
    @applist = Applist.new(applist_params)

    respond_to do |format|
      if @applist.save
        format.html { redirect_to applist_url(@applist), notice: "Applist was successfully created." }
        format.json { render :show, status: :created, location: @applist }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @applist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /applists/1 or /applists/1.json
  def update
    respond_to do |format|
      if @applist.update(applist_params)
        format.html { redirect_to applist_url(@applist), notice: "Applist was successfully updated." }
        format.json { render :show, status: :ok, location: @applist }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @applist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /applists/1 or /applists/1.json
  def destroy
    @applist.destroy

    respond_to do |format|
      format.html { redirect_to applists_url, notice: "Applist was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applist
      @applist = Applist.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def applist_params
      params.require(:applist).permit(:title, :logo, :app_link, :redeem_type, :bonus, :minimum_withdrawl, :referral_code)
    end
end
