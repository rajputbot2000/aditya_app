class WithdrawlsController < ApplicationController
  before_action :set_withdrawl, only: %i[ show edit update destroy ]

  # GET /withdrawls or /withdrawls.json
  def index
    @withdrawls = Withdrawl.all
  end

  # GET /withdrawls/1 or /withdrawls/1.json
  def show
  end

  # GET /withdrawls/new
  def new
    @withdrawl = Withdrawl.new
  end

  # GET /withdrawls/1/edit
  def edit
  end

  # POST /withdrawls or /withdrawls.json
  def create
    @withdrawl = Withdrawl.new(withdrawl_params)

    respond_to do |format|
      if @withdrawl.save
        format.html { redirect_to withdrawl_url(@withdrawl), notice: "Withdrawl was successfully created." }
        format.json { render :show, status: :created, location: @withdrawl }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @withdrawl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /withdrawls/1 or /withdrawls/1.json
  def update
    respond_to do |format|
      if @withdrawl.update(withdrawl_params)
        format.html { redirect_to withdrawl_url(@withdrawl), notice: "Withdrawl was successfully updated." }
        format.json { render :show, status: :ok, location: @withdrawl }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @withdrawl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /withdrawls/1 or /withdrawls/1.json
  def destroy
    @withdrawl.destroy

    respond_to do |format|
      format.html { redirect_to withdrawls_url, notice: "Withdrawl was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdrawl
      @withdrawl = Withdrawl.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def withdrawl_params
      params.require(:withdrawl).permit(:coins, :transaction_id, :amount, :account_id)
    end
end
