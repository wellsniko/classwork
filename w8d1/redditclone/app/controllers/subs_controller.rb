class SubsController < ApplicationController
    before_action :sub_owner? , only: [:edit, :update, :destroy]
    before_action :require_logged_in, except: [:show, :index]
    def sub_owner?
        current_user.subs.find_by(id: params[:id])
    end

    def new
        @sub = Sub.new
        render :new
    end

    def create
        @sub = Sub.new(sub_params)
        @sub.moderator_id = current_user.id
        if @sub.save 
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :new
        end
    end

    def show
        @sub = Sub.find_by(id: params[:id])
        render :show
    end

    def index
        @subs = Sub.all
        render :index
    end

    def edit
        @sub = Sub.find_by(id: params[:id])
        render :edit
    end

    def update
        @sub = Sub.find_by(id: params[:id])
        if @sub.update(sub_params) && current_user.id == @sub.moderator_id
            redirect_to sub_url(@sub)
        else
            flash[:errors] = @sub.errors.full_messages
            render :edit
        end
    end

    def destroy
        @sub = Sub.find_by(id: params[:id])
        @sub.destroy if current_user == @sub.moderator_id
        redirect_to subs_url
    end

    private
    def sub_params
        params.require(:sub).permit(:title, :description)
    end

end
