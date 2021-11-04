class InfosController < ApplicationController
  before_action :set_info, only: [:show, :update, :destroy]

  # GET /infos
  def index
    @infos = Info.all

    render json: @infos
  end

  # GET /infos/1
  def show
    render json: @info
  end


  # POST /infos/new_infos

  def new_infos
    info = []
    info.append({:unique_users => Info.task_qtd_unique_users})
    info.append(:request_types => Info.task_qtd_request_types)
    info.append(:most_user => Info.task_most_accessed_ip)
    info.append(:most_resource => Info.task_most_accessed_url)
    render json: info
  end


  # POST /infos
  def create
    @info = Info.new(info_params)

    if @info.save
      render json: @info, status: :created, location: @info
    else
      render json: @info.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /infos/1
  def update
    if @info.update(info_params)
      render json: @info
    else
      render json: @info.errors, status: :unprocessable_entity
    end
  end

  # DELETE /infos/1
  def destroy
    @info.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_info
      @info = Info.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def info_params
      params.require(:info).permit(:request_types, :unique_users, :most_resource, :most_user)
    end
end
