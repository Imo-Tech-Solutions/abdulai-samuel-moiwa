class AsetsController < ApplicationController
  before_action :set_aset, only: %i[ show edit update destroy ]

  # GET /asets or /asets.json
  def index
    @asets = Aset.all
  end

  # GET /asets/1 or /asets/1.json
  def show
  end

  # GET /asets/new
  def new
    @aset = Aset.new
  end

  # GET /asets/1/edit
  def edit
  end

  # POST /asets or /asets.json
  def create
    @aset = Aset.new(aset_params)
    @aset.save
    qr = RQRCode::QRCode.new(aset_url(@aset), :size => 5, :level => :h)
    svg = qr.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6
    )
    directory = "#{Rails.root}/public/asets/qr_codes"
    FileUtils.mkdir_p(directory) unless File.directory?(directory)
    File.open("#{directory}/#{@aset.id}.svg", "w") do |file|
      file.write(svg)
    end
    redirect_to @aset, notice: 'Asset was successfully created.'
  end


  # PATCH/PUT /asets/1 or /asets/1.json
  def update
    respond_to do |format|
      if @aset.update(aset_params)
        format.html { redirect_to aset_url(@aset), notice: "Aset was successfully updated." }
        format.json { render :show, status: :ok, location: @aset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @aset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /asets/1 or /asets/1.json
  def destroy
    @aset.destroy

    respond_to do |format|
      format.html { redirect_to asets_url, notice: "Aset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_aset
      @aset = Aset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def aset_params
      params.require(:aset).permit(:name, :serial_number, :purchase_date, :purchase_price, :location, :current_owner, :warranty_expiration_date, :maintenance_history, :asset_category, :asset_status)
    end
end
