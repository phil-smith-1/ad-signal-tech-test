class VideosController < ApplicationController
  before_action :set_video, only: %i[ show edit update destroy ]
  before_action :delete_files, only: %i[ destroy ]
  after_action :create_screenshots, only: %i[ create update ]

  # GET /videos
  def index
    @videos = Video.all
  end

  # GET /videos/1
  def show
  end

  # GET /videos/new
  def new
    @video = Video.new
  end

  # GET /videos/1/edit
  def edit
  end

  # POST /videos
  def create
    @video = Video.new(video_params)

    if @video.save
      redirect_to @video, notice: "Video was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /videos/1
  def update
    if @video.update(video_params)
      redirect_to @video, notice: "Video was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /videos/1
  def destroy
    @video.destroy
    redirect_to videos_url, notice: "Video was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_video
      @video = Video.includes(:images).find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def video_params
      params.require(:video).permit(:title, :path)
    end

    def create_screenshots
      VideoProcessingJob.perform_async(@video.id)
    end

    def delete_files
      FileUtils.rm_rf("public/uploads/video/path/#{@video.id}")
    end
end
