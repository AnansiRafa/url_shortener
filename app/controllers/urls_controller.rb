class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy]
  before_action :show_url, only: [:show]


  def index
    @urls = Url.all
  end

  def show
    redirect_to @url.long
  end


  def new
    @url = Url.new
  end

  def edit
  end

  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to urls_path, notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to @url, notice: 'Url was successfully updated.' }
        format.json { render :show, status: :ok, location: @url }
      else
        format.html { render :edit }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /urls/1
  # DELETE /urls/1.json
  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    def show_url
       if params[:id].to_i == 0
         @url = Url.find_by(short: "#{params[:id]}")
       else
         @url = Url.find_by(id: params[:id])
    end
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:long, :short)
    end
end
