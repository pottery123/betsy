class BillingsController < ApplicationController

  def index

  end

  def new


  end



  def create
    @billings = Billing.new(params[:billings_params])

    if @billings.save
        flash[:notice] = "saved!"
    else
        render "new"
    end
  end

  def edit
    @billings = Billings.find(params[:id])
  end



  def update

  end


  def destroy

  end

  private

  def billings_params
    params.require(:billings).permit(:email, :addresss,:number_on_cc,:security_on_cc,:expiration_on_cc,:zip  )
  end

end
