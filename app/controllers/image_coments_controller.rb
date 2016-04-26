class ImageComentsController < ApplicationController
  before_action :set_image_coment, only: [:show, :edit, :update, :destroy]

  # GET /image_coments
  # GET /image_coments.json
  def index
    @image_coments = ImageComent.all
  end

  # GET /image_coments/1
  # GET /image_coments/1.json
  def show
  end

  # GET /image_coments/new
  def new
    @image_coment = ImageComent.new
  end

  # GET /image_coments/1/edit
  def edit
  end

  # POST /image_coments
  # POST /image_coments.json
  def create
    @image_coment = ImageComent.new(image_coment_params)
    @image_coment.user_id = current_user.id
    if @image_coment.save
      url= "/images/" + @image_coment.image_id.to_s
      respond_to do |format|
        format.html do
          flash[:success] = 'Comment posted.'
          redirect_to url
        end
        format.js # JavaScript response
      end
    end

    # respond_to do |format|
    #   if @image_coment.save
    #     url = "/images/" + @image_coment.image_id.to_s
    #     format.html { redirect_to url, notice: 'Image coment was successfully created.' }
    #     format.json { render :show, status: :created, location: @image_coment }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @image_coment.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /image_coments/1
  # PATCH/PUT /image_coments/1.json
  def update
    respond_to do |format|
      if @image_coment.update(image_coment_params)
        format.html { redirect_to @image_coment, notice: 'Image coment was successfully updated.' }
        format.json { render :show, status: :ok, location: @image_coment }
      else
        format.html { render :edit }
        format.json { render json: @image_coment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /image_coments/1
  # DELETE /image_coments/1.json
  def destroy
    image = @image_coment.image
    @image_coment.destroy
     respond_to do |format|
      format.html do
        flash[:success] = 'Comment deleted.'
        redirect_to image_path(image)
      end
      format.js # JavaScript response
    end
    # respond_to do |format|
    #   format.html { redirect_to image_path(image), notice: 'Image coment was successfully destroyed.' }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_image_coment
      @image_coment = ImageComent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def image_coment_params
      params.require(:image_coment).permit(:user_id, :image_id, :comment)
    end
end
