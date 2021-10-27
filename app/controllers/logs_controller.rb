class LogsController < ApplicationController
  before_action :set_log, only: [:show, :update, :destroy]

  # GET /logs
  def index
    @logs = Log.all

    render json: @logs
  end

  # GET /logs/1
  def show
    render json: @log
  end


  # POST /upload_batch


  def upload_batch
    if file_line = File.readlines(params[:filename])
      file_line.each do |line|
        regex = /\A(?<ip>\S+) \S+ \S+ \[(?<time>[^\]]+)\] "(?<method_line>GET|POST) (?<url_line>\S+) \S+?" (?<status>\d+) (?<bytes>\S+)/
        if parts = regex.match(line)
        Log.create!(
          ip_address: parts[:ip],
          url: parts[:url_line],
          method: parts[:method_line]
        )
        end
      end
    end
  end

  # POST /logs
  def create
    @log = Log.new(log_params)

    if @log.save
      render json: @log, status: :created, location: @log
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /logs/1
  def update
    if @log.update(log_params)
      render json: @log
    else
      render json: @log.errors, status: :unprocessable_entity
    end
  end

  # DELETE /logs/1
  def destroy
    @log.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def log_params
      params.require(:log).permit(:ip_address, :url, :method)
    end
end
