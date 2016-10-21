class PaymentsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @user = current_user
    token = params[:stripeToken]

    # Create the charge on Stripe's servers - this will charge the user's card
    begin
      charge = Stripe::Charge.create(
      :amount => (@product.price*100), # amount in cents, again
      :currency => "usd",
      :source => token,
      :description => params[:stripeEmail]
      )

      if charge.paid
        Order.create(user_id: @user.id, product_id: @product.id , total: @product.price)
        redirect_to product_path(@product), notice: "Congrats, you know how to enter in a credit card number and click a button. Well done."
      end

      rescue Stripe::CardError => e
        # The card has been declined
        body = e.json_body
        err = body[:error]
        flash[:error] = "Unfortunately, there was an error processing your payment: #{err[:message]}"
      end
  end
end
