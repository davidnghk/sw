class DownloadsController < ApplicationController
 
  def show
    respond_to do |format|
      format.pdf { send_complaint_pdf }
      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
  end
 
  private
 
  def complaint
    Complaint.find(params[:complaint_id])
  end

  def complaint_pdf
    ComplaintPdf.new(complaint)
  end
 
  def send_complaint_pdf
    send_file complaint_pdf.to_pdf,
      filename: complaint_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end

  def render_sample_html
    render template: "complaints/pdf", layout: "complaint_pdf", locals: { complaint: complaint }
  end
end