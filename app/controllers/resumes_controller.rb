class ResumesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy, :new, :index]
  before_action :correct_user,   only: :destroy
  around_action :with_locale
  
  def index
    @resumes = current_user.resumes.search(params[:search]).paginate(:per_page => 7, :page => params[:page])
    @resume = Resume.new
    
    respond_to do |format|
      format.html {}
      format.js { }
    end
  end

  def new
    @resume = Resume.new
  end

  def create
    @resume = current_user.resumes.build(resume_params)
    if(@resume.save)
      flash[:success] = "Archivo subido correctamente"
      redirect_to resumes_path
    else
      @resumes = current_user.resumes.search(params[:search]).paginate(:per_page => 7, :page => params[:page])
      render "index"
    end
  end

  def destroy
    @resume.destroy
    flash[:danger] = "The File #{@resume.file} has been deleted."
    redirect_to resumes_path
    
  end
  
  
  private
    def resume_params
      params.require(:resume).permit(:file, :file_url)
    end
    
    def correct_user
      @resume = current_user.resumes.find_by(id: params[:id])
      redirect_to root_url if @resume.nil?
    end
    
    def with_locale
      I18n.with_locale(params[:locale]) { yield }
    end
    
    def default_url_options(options = {})
      { locale: I18n.locale }
    end
end
