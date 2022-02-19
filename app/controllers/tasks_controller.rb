class TasksController < ApplicationController
  # load_and_authorize_resource
  before_action :set_task, only: %i[ show edit update destroy ]
  # include TasksHelper



  
  # GET /tasks or /tasks.json
  def index
    # @tasks = current_user.tasks.select(:id, :title, :content, :image, :audio_record, :audio, :created_at, :user_id, :task_avatar).order(created_at: :DESC)
    @tasks = Task.select(:id, :title, :content, :image, :audio_record, :audio, :created_at, :user_id).order(created_at: :DESC).page.per(4)
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    # @student_audios = @task.audio_students
    # @student_audio = @task.audio_student.build
  end
 
  def student_show
    @tasks = Task.select(:id, :title, :content, :image, :audio_record, :audio, :created_at, :user_id).order(created_at: :DESC).page
    @student_audios = StudentAudio.select(:audio_student)
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
    
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to student_show_task_url(@task), notice: "Task was successfully updated." }
        format.json { render :student_show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    if @task.image? && @task.audio?
      @task.image.purge && @task.audio.purge && @task.destroy 
    else 
      @task.destroy 
    end


    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_task
    @task = Task.find(params[:id])
  end

 
  # Only allow a list of trusted parameters through.
  def task_params
    params.require(:task).permit(:title, :content, :image, :audio_record, :audio, :user_id, :created_at, :task_avatar, :page, :audio_student)
  end
end
