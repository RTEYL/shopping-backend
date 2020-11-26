class Api::V1::ItemsController < ApplicationController

    def index
      items = Item.all
      render json: items
    end

    def create
      byebug
      item= Item.create(params)
      if item.save
        render json: {status: 201, errors: "item was updated successfully"}
      else
        render json: {status: 400, errors: item.errors.full_messages}
      end
    end

    def show
      byebug
      item = Item.find_by_id(params[:id])
      if item
        render json: {status: 200, item: item}
      else
        render json: {status: 400, errors: 'item not found'}
      end
    end

    def update
      byebug
      item = Item.find_by_id(params[:id])
      item.update(params)
      if item.save
        render json: {status: 201, errors: "item was updated successfully"}
      else
        render json: {status: 400, errors: "server was unable to update the item"}
      end
    end

    def destroy
      item = Item.find_by_id(params[:id])
      item.destroy
      if item.destroyed?
        render json: {status: 201, errors: "item was removed form database"}
      else
        render json: {status: 400, errors: "server request failed to remove item"}
      end
    end
end
