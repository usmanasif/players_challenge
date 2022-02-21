# frozen_string_literal: true

class BaseController < ApplicationController
  include BaseHandler
  include ExceptionHandler

  before_action :create_resource, only: :create
  before_action :build_resource, only: :new

  protected

  def index
    resources
  end

  def new
    resource
  end

  def edit
    resource
  end

  def create
    if resource.save
      flash[:notice] = "#{humanized_model_name} is created successfully"
      redirect_to send("#{controller_name.singularize}_path", resource.id)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if resource.update(permitted_params)
      flash[:notice] = "#{humanized_model_name} is updated successfully"
      redirect_to send("#{controller_name.singularize}_path", resource.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if resource.destroy
      flash[:notice] = "#{humanized_model_name} is deleted successfully"
    else
      flash[:alert] = "Unable to delete #{humanized_model_name}"
    end

    redirect_to send("#{controller_name}_path")
  end

  def show
    resource
  end

  # index method
  def resources
    @resources ||= model.page(params[:page])
  end

  # show/edit method
  def resource
    @resource ||= model.find(params[:id])
  end

  # new method
  def build_resource
    @resource = model.new
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

  def humanized_model_name
    model_name.underscore.humanize
  end
end
