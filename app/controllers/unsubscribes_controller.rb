class UnsubscribesController < ApplicationController
  before_action :set_unsubscribe, only: [:show, :edit, :update, :destroy]
  before_filter :authorize_admin, only: [:index, :show, :update, :destroy, :edit]
  
  respond_to :html

  def index
    @unsubscribes = Unsubscribe.all
    respond_with(@unsubscribes)
  end

  def show
    respond_with(@unsubscribe)
  end

  def new
    @unsubscribe = Unsubscribe.new
    respond_with(@unsubscribe)
  end

  def edit
  end

  def create
    @unsubscribe = Unsubscribe.new(unsubscribe_params)
    @unsubscribe.save
    if verify_recaptcha(model: @unsubscribe) && @unsubscribe.save
      redirect_to root_path
    else
      render 'new'
    end
    #respond_with(@unsubscribe)
  end

  def update
    @unsubscribe.update(unsubscribe_params)
    respond_with(@unsubscribe)
  end

  def destroy
    @unsubscribe.destroy
    respond_with(@unsubscribe)
  end

  private
    def set_unsubscribe
      @unsubscribe = Unsubscribe.find(params[:id])
    end

    def unsubscribe_params
      params.require(:unsubscribe).permit(:email)
    end
end
