class OrdersController < ApplicationController
  #before_action :set_order, only: [:show, :edit, :update, :destroy]
  before_action :set_order, only: [:show, :edit, :update, :destroy,
          :cancel, :acknowledge, :file, :complete, :reopen, :downloadimages]

  def cancel
    @order.cancel!
    redirect_to orders_path(:status => "Open")
  end

  def file
    @order.file!
    #OrderMailer.new_order_to_authority(@order).deliver_now 
    redirect_to order_path(@order)
  end

  def downloadimages
    archiveFolder = Rails.root.join('tmp/archive.zip') #Location to save the zip
    # Delte .zip folder if it's already there
    FileUtils.rm_rf(archiveFolder)    
    #Zip::File.open("images_#{self.id}.zip", Zip::File::CREATE) do |zipfile|
    Zip::File.open(archiveFolder, Zip::File::CREATE) do |zipfile|
      @order.photos.each do |photo|
          open("tmp/image_#{photo.id}", 'wb') do |file|
            file << open("#{photo.image}").read
            # Two arguments:
            #filename = photo.id.to_s + ".jpg" 
            extension = File.extname("#{photo.image}") 
            filename = photo.id.to_s + extension 
            # - The name of the file as it will appear in the archive
            # - The original file, including the path to find it
            zipfile.add(filename, file)
          end
      end
    end
    # Send the archive as an attachment
    send_file(archiveFolder, :type => 'application/zip', :filename => 'images.zip', :disposition => 'attachment')
  end
# GET /orders
# GET /orders.json
    def search
      @q = Order.search(params[:q])
      @results = @q.result
      @results = @results.where(" booking_datetime >= ? ", Date.today ) unless params[:q]
      @orders = @results.page(params[:page]).per_page(50)
      respond_to do |format|
        format.html
      end
    end

  # GET /orders
  # GET /orders.json
  def index
    if params[:status] 
      case params[:status]
        when "Open"
          @orders = Order.Open
        when "Filed"
          @orders = Order.Filed 
        when "Cancelled" 
          @orders = Order.Cancelled
        when "All" 
          @orders = Order.all
        else
          @orders = Order.all
        end
        @orders = @orders.page(params[:page]).per_page(30)
    else
        if params[:commit] == "Search"
          @search = Order.search(params[:q])
          @results = @search.result
          if params[:format] == "xls"
            @orders = @results
          else
            @results = @results.where(" bookling_datetime >= ? ", Date.yesterday ) unless params[:q]
            @orders = @results
          end
        else
          @orders = Order.all
        end
    end

    if !current_user.Admin? 
      @orders = @orders.where('user_id = ?', current_user.id)
    end 
    @orders = @orders.order(created_at: :desc).paginate(page:params[:page], per_page: 20 )
    
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    respond_to do |format|
        format.html 
        format.pdf do
          pdf = OrderPdf.new(@order)
          send_data pdf.render, filename: "NF_#{@order.order_no}.pdf",
                                type: "application/pdf",
                                disposition: "inline"
        end 
      end

  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit

  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    @order.booking_datetime = DateTime.now if @order.booking_datetime.nil?
    @order.user = current_user

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update

    respond_to do |format|
      # if @order.update(order_params)
      if @order.update_attributes(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
      @photoable = @order
      @photos = @photoable.photos 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:store_id, :user_id, :technician_id, 
        :booking_datetime, :district_id, :status, :issue_id, :user_ref, :notes, 
        :staff_name, :staff_signoff_date, :customer_name, :customer_signoff_date,
        :staff_signoff_datetime, :customer_signoff_datetime,
        :location, :source_ref, :order_no)
    end
end