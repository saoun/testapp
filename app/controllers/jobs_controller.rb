class JobsController < ApplicationController

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  # def create
  #   Job.create(job_params)
  #   redirect_to jobs_path
  # end

  # OR WRITE THIS FOR ERROR MESSAGES

  def create
    @job = Job.new(job_params)

    if @job.save
      redirect_to jobs_path
    else
      render :new
    end
  end


  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id]) # of j = Job.find(params[:id]) --> so can write anything before '='
    @job.update_attributes(job_params) # or @job.update(job_params)

    redirect_to jobs_path # can also write it as jobs_url
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy # no need for job params
    redirect_to jobs_path
  end

  def show
    @job = Job.find(params[:id])
  end


private

def job_params
  params.require(:job).permit(:title, :description, :company)
end

end
