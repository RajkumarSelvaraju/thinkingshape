class OrdersController < ApplicationController
  def index
    #@orders = Order.all
    #def index
      #session[:cust_id] = params[:format]
      #@orders = Order.where(customer_id: params[:format])
    #end
    @orders =  Customer.joins(:orders).select('customers.fname,orders.id as id, orders.name as name,orders.po_no as po_no,orders.po_date as po_date,orders.due_date as due_date')
  end
  
  def cust_order
    session[:customer_id] = params[:format]
    @customer = Customer.find(params[:format])
    @customer.fname
    @orders = @customer.orders
  end

  def show
    @orders = Order.find(params[:id])
  end

  def new
    @order = Order.new
  end
  
  def create
    #@order = Order.new(order_params)
    #if @order.save
    #  redirect_to orders_path
    #else
    #  render :new
    #end
    @order = Order.new(order_params)
    @order.customer_id = session[:customer_id]
    if @order.save
      redirect_to orders_path
    else
      render :new
    end
  end

  def edit
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to orders_path
    else
      render :edit
    end
  end
  
  def delete
    @order = Order.find(params[:format])
    @order.destroy
    redirect_to orders_path
  end
  
  def destroy
    @order = Order.find(params[:id])
    #@order.customer_id = session[:customer_id]
    @order.destroy
    redirect_to orders_path
  end
  
  private
  
  def order_params
    params.require(:order).permit(:name, :po_no, :po_date, :due_date, :customer_id)
  end
  
end
