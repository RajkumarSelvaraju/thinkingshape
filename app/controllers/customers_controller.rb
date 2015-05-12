class CustomersController < ApplicationController
  
  def index
    @customers = Customer.all
  end

  def new
    @customer = Customer.new
  end
  
  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      redirect_to customers_path
    else
      render :new
    end
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_path
    else
      render :edit
    end
  end
  
  def destroy
    @customer = Customer.find(params[:id])
    @customer.destroy
    redirect_to customers_path
  end
  
  def show
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Customer_Report.pdf', template: 'customers/show.pdf.erb', layout: 'layouts/pdf.html.erb'
        #@pdf = (render_to_string pdf: "PDF", template: "customers/show.pdf.erb", layout: 'layouts/pdf.html.erb', encoding: "UTF-8")
        #send_data(@pdf, type: "application/pdf", filename: "Show")
      end
    end
  end
  
  def export
    @customer = Customer.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'Customer_Report', template: 'customers/export.pdf.erb', layout: 'layouts/pdf.html.erb'
        #@pdf = (render_to_string pdf: "PDF", template: "customers/export.pdf.erb", layout: 'layouts/pdf.html.erb', encoding: "UTF-8", disposition: "attachment")
        #send_data(@pdf, type: "application/pdf", filename: "Customer-Report", disposition: "inline")
      end
      #format.csv { send_data @risks.to_csv }
      #format.xlsx
    end
  end
  
  # Dashboard
  def dashboard
    
  end
  
  # Report
  def report
    @customers = Customer.all
    respond_to do |format|
      format.html
      format.xlsx 
    end
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(:fname, :lname, :company, :country, :mobile, :email)
  end
end