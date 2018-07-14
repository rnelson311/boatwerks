class InvoicesController < ApplicationController
  before_action :set_invoice, only: [:show, :edit, :update, :destroy]

  def index
    @invoices = Invoice.all
  end

  def show
  end

  def new
    @invoice = Invoice.new
  end

  def edit
    @invoice = Invoice.find(params[:id])
    @invoice_items = @invoice.invoice_items
    UpdateInvoices.new( {invoice: @invoice, invoice_items: @invoice_items} ).perform
  end

  def create
    @invoice = Invoice.new(invoice_params)
    @invoice_items = @invoice.invoice_items
    UpdateInvoices.new( {invoice: @invoice, invoice_items: @invoice_items} ).perform

    respond_to do |format|
      if @invoice.save
        format.html { redirect_to @invoice, notice: 'Invoice was successfully created.' }
        format.json { render :show, status: :created, location: @invoice }
      else
        format.html { render :new }
        format.json { render json: @invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @invoice.update(invoice_params)
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

  private
    def set_invoice
      @invoice = Invoice.find(params[:id])
    end

    def invoice_params
      params.require(:invoice).permit(:client_id, :boat_id, :date, :tax, :subtotal, :total, :is_payed,
                                      invoice_items_attributes: [:id, :description, :unit_cost, :quantity, :discount, :_destroy])
    end
end
