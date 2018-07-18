class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all
  end

  def show; end

  def new
    @invoice = Invoice.new
  end

  def edit; end

  def create
    @invoice = Invoice.new(invoice_params)
    respond_to do |format|
      if @invoice.save
        UpdateInvoices.new(@invoice).call
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @invoice = Invoice.find(params[:id])
    respond_to do |format|
      if @invoice.update(invoice_params)
        UpdateInvoices.new(@invoice).call
        format.html { redirect_to @invoice, notice: 'Invoice was successfully updated.' }
        format.json { render :show, status: :ok, location: @invoice }
      else
        format.html { render :edit }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @invoice.destroy
    respond_to do |format|
      format.html { redirect_to invoices_url, notice: 'Invoice was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def clone
    @invoice = Invoice.find(params[:invoice_id])
    new_invoice = @invoice.clone
    new_invoice.save

    redirect_to invoices_path
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.require(:invoice).permit(:client_id, :boat_id, :date, :tax, :subtotal, :total, :is_payed, :is_quote,
                                    invoice_items_attributes: [:id, :description, :unit_cost, :quantity, :discount, :_destroy])
  end
end
