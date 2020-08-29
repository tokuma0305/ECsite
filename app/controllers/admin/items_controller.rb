class Admin::ItemsController < ApplicationController
	def new
		@item = Item.new
	end
	def index
		@items = Item.all
	end
	def create
		@item = Item.new(item_params)
		if @item.save
		redirect_to admin_item_path(@item)
		else
			render "new"
		end
	end
	def show
		@item = Item.find(params[:id])
	end
	def edit
		
	end
	def update
		
	end
	private
	def item_params
		params.require(:item).permit(:description, :price, :image, :is_active, :name, :genre_id)
	end
end
