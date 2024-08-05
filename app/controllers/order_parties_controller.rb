class OrderPartiesController < ApplicationController
  before_action :set_order_party, only: [:show, :edit, :update, :destroy]

  # GET /order_parties
  # GET /order_parties.json
  def index
    @order_parties = OrderParty.all
  end

  # GET /order_parties/1
  # GET /order_parties/1.json
  def show
  end

  # GET /order_parties/new
  def new
    @order_party = OrderParty.new
    @order_party.order_id = params[:order_id]
  end

  # GET /order_parties/1/edit
  def edit
  end

  # POST /order_parties
  # POST /order_parties.json
  def create
    @order_party = OrderParty.new(order_party_params)

    respond_to do |format|
      if @order_party.save
        format.html { redirect_to order_url(@order_party.order_id), notice: 'party was successfully created.' }
        format.json { render :show, status: :created, location: @order_party }
      else
        format.html { render :new }
        format.json { render json: @order_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_parties/1
  # PATCH/PUT /order_parties/1.json
  def update
    respond_to do |format|
      if @order_party.update(order_party_params)
        format.html { redirect_to @order_party, notice: 'Order party was successfully updated.' }
        format.json { render :show, status: :ok, location: @order_party }
      else
        format.html { render :edit }
        format.json { render json: @order_party.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_parties/1
  # DELETE /order_parties/1.json
  def destroy
    @order_party.destroy
    respond_to do |format|
      format.html { redirect_to order_url(@order_party.order_id), notice: 'party was successfully created.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_party
      @order_party = OrderParty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_party_params
      params.require(:order_party).permit(:order_id, :name, :designation, :organization)
    end
end
