class BaseController < ApplicationController
  include BaseHandler
  include ExceptionHandler

  protected

  def index
    resources
  end

  def new
    new_resource
  end

  def edit
    resource
  end

  def create
    byebug
    if created_resource.save
      flash[:notice] = "#{model_name.underscore.humanize.downcase} is created successfully"
      redirect_to send("#{controller_name.singularize}_path", created_resource.id)
    else
      flash[:alert] = "Unable to create #{model_name.underscore.humanize.downcase}"
      render :new
    end
  end

  def update
    if resource.update(permitted_params)
      flash[:notice] = "#{model_name.underscore.humanize.downcase} is updated successfully"
      redirect_to send("#{model_name.underscore.humanize.downcase}_path", resource.id)
    else
      flash[:alert] = "Unable to update #{model_name.underscore.humanize.downcase}"
      render :edit
    end
  end

  def destroy
    if resource.destroy
      flash[:notice] = "#{model_name.underscore.humanize.downcase} is deleted successfully"
      redirect_to send("#{controller_name}_path")
    else
      flash[:alert] = "Unable to delete #{model_name.underscore.humanize.downcase}"
      redirect_to send("#{controller_name}_path")
    end
  end

  def show
    resource
  end

  # index method
  def resources
    @resources ||= model.all
  end

  # show/edit method
  def resource
    @resource ||= model.find(params[:id])
  end

  # new method
  def new_resource
    @new_resource ||= model.new
  end

  # use for create method
  def created_resource
    @new_resource ||= model.new(permitted_params)
  end

  def model
    model_name.constantize
  end

  def model_name
    controller_name.camelize.singularize
  end
end
