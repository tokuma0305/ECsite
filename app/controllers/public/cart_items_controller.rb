class Public::CartItemsController < ApplicationController
	def index
		@cart_items = CartItem.all
	end
	def create
		@cart_items = CartItem.all
		@cart_item = CartItem.new(cart_item_params)
		@cart_item.end_user_id = current_end_user.id
		if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
			cart_item = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
			cart_item.amount += params[:cart_item][:amount].to_i
			cart_item.save
			redirect_to cart_items_path
		else
			if @cart_item.save
				redirect_to cart_items_path
			else
				render :index
			end
		end	
	end
	def destroy
		cart_item = CartItem.find(params[:id])
		cart_item.destroy
		redirect_to request.referrer
	end
	def all_destroy
		current_end_user.cart_items.destroy_all
		redirect_to cart_items_path
	end
	def update
		@cart_items = CartItem.all
		@cart_item = CartItem.find(params[:id])
		@cart_item.end_user_id = current_end_user.id
		if @cart_item.update(cart_item_params)
			redirect_to request.referrer
		else
			render "index"
		end
	end
	private
	def cart_item_params
		params.require(:cart_item).permit(:amount, :item_id, :end_user_id)
	end
	
end
