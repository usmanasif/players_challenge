# frozen_string_literal: true

class BaseController < ApplicationController
  include BaseHandler
  include ExceptionHandler

  before_action :create_resource, only: :create

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
    if resource.save
      flash[:notice] = "#{model_name.underscore.humanize} is created successfully"
      redirect_to send("#{controller_name.singularize}_path", resource.id)
    else
      render :new, :unprocessable_entity
    end
  end

  def update
    if resource.update(permitted_params)
      flash[:notice] = "#{model_name.underscore.humanize} is updated successfully"
      redirect_to send("#{model_name.underscore.downcase}_path", resource.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if resource.destroy
      flash[:notice] = "#{model_name.underscore.humanize} is deleted successfully"
    else
      flash[:alert] = "Unable to delete #{model_name.underscore.humanize}"
    end

    redirect_to send("#{controller_name}_path")
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
  def create_resource
    @resource = model.new(permitted_params)
  end

  def model
    model_name.constantize
  end

  def model_name
    controller_name.camelize.singularize
  end
end
