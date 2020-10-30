class Public::OrdersController < ApplicationController
    before_action :authenticate_end_user!
    def new
        @order = Order.new
        @end_user = current_end_user
        @address = Address.where(end_user_id:current_end_user.id)
    end
    def create
        @order = Order.new(order_params)
        @end_user = current_end_user
        @order.end_user_id = current_end_user.id
        if  params[:order][:address_option] == "0"
            @order.zipcode = @end_user.zipcode
            @order.address = @end_user.address
            @order.addressee = @end_user.lastname + @end_user.firstname
        elsif params[:order][:address_option] == "1"
            @info = params[:order][:address].to_i
            @address = Address.find(@info)
            @order.zipcode = @address.zipcode
            @order.address = @address.address
            @order.addresee = @address.addressee
        elsif params[:order][:address_option] == "2"
            @order.zipcode = params[:order][:a][:zipcode]
            @order.address = params[:order][:a][:address]
            @order.addressee = params[:order][:a][:addressee]
        else
            render :confirm if @order.invalid?
        end
        @order.save
        redirect_to orders_complete_path
    end
    def confirm
        @order = Order.new
        @end_user = current_end_user
        @cart_items = CartItem.all
        @order.paymethod = params[:order][:paymethod]
        if  params[:order][:address_option] == "0"
            @order.zipcode = @end_user.zipcode
            @order.address = @end_user.address
            @order.addressee = @end_user.lastname + @end_user.firstname
        elsif params[:order][:address_option] == "1"
            @info = params[:order][:address].to_i
            @address = Address.find(@info)
            @order.zipcode = @address.zipcode
            @order.address = @address.address
            @order.addresee = @address.addressee
        elsif params[:order][:address_option] == "2"
            @order.zipcode = params[:order][:a][:zipcode]
            @order.address = params[:order][:a][:address]
            @order.addressee = params[:order][:a][:addressee]
        else
            render :new if @order.invalid?
        end
    end
    def complete
        
    end
    private
    def order_params
        params.require(:order).permit(:paymethod, :address, :zipcode, :end_user_id, :addressee, :total_payment, :postage, :order_status,
        order_details_attributes:{:item_id, :order_id, :amount, :price_include_tax, :product_status})
    end
end
