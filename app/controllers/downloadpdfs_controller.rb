class DownloadpdfsController < ApplicationController
 
  def show
    respond_to do |format|
      format.pdf { send_order_pdf }
      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
  end

  private

  def order 
    Order.find(params[:order_id])
  end

  def columns 
    params[:columns]
  end

  def order_pdf
    OrderPdf.new(order)
  end

  def send_order_pdf
    send_file order_pdf.to_pdf,
      filename: order_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

  def render_sample_html
    render template: "orders/pdf", layout: "order_pdf", locals: { order: order, columns: columns }
  end


end