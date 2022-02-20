class StudentAudiosController < ApplicationController
  before_action :set_student_audio, only: %i[ show edit update destroy ]
  before_action :set_task, only: %i[ new create show edit update ]
  # before_action :set_user, only: %i[ new create show edit update ]

  # GET /student_audios or /student_audios.json
  def index
    @student_audios = StudentAudio.all
  end

  # GET /student_audios/1 or /student_audios/1.json
  def show
  end

  # GET /student_audios/new
  def new
    # @user = User.find(params[:user_id])
    @task = Task.find(params[:task_id])
    @student_audio = @task.student_audios.new
  end

  # GET /student_audios/1/edit
  def edit
  end

  # POST /student_audios or /student_audios.json
  def create
    

    @task = Task.find(params[:task_id])
    # @user = User.find(params[:user_id])
    @student_audio = @task.student_audios.build(student_audio_params)
    @student_audio.user_id = current_user.id

    respond_to do |format|
      if @student_audio.save
        format.html { redirect_to task_student_audios_path, notice: "Student audio was successfully created." }
        format.json { render :student_show, status: :created, location: @student_audio }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @student_audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /student_audios/1 or /student_audios/1.json
  def update
    binding.irb
    respond_to do |format|
      if @student_audio.update(student_audio_params)

        format.html { redirect_to student_show_task_url(@task ), notice: "Student audio was successfully updated." }
        format.json { render :student_show, status: :ok, location: @student_audio }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @student_audio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_audios/1 or /student_audios/1.json
  def destroy
    @student_audio.destroy

    respond_to do |format|
      format.html { redirect_to student_audios_url, notice: "Student audio was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_student_audio
      @student_audio = StudentAudio.find(params[:id])
    end
    def set_task
      @task = Task.find(params[:task_id])
    end
    # def set_user
    #   @user = User.find(params[:user_id])
    # end

    # Only allow a list of trusted parameters through.
    def student_audio_params
      params.require(:student_audio).permit(:audio_student, :task_id, :user_id, :image, :audio, :tittle)
    end
end
