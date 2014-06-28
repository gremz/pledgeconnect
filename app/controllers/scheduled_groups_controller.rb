class ScheduledGroupsController < ApplicationController
  before_action :set_scheduled_group, only: [:show, :edit, :update, :destroy]

  # GET /scheduled_groups
  # GET /scheduled_groups.json
  def index
    @scheduled_groups = ScheduledGroup.all
  end

  # GET /scheduled_groups/1
  # GET /scheduled_groups/1.json
  def show
  end

  # GET /scheduled_groups/new
  def new
    @scheduled_group = ScheduledGroup.new
  end

  # GET /scheduled_groups/1/edit
  def edit
  end

  # POST /scheduled_groups
  # POST /scheduled_groups.json
  def create
    @scheduled_group = ScheduledGroup.new(scheduled_group_params)

    respond_to do |format|
      if @scheduled_group.save
        format.html { redirect_to @scheduled_group, notice: 'Scheduled group was successfully created.' }
        format.json { render action: 'show', status: :created, location: @scheduled_group }
      else
        format.html { render action: 'new' }
        format.json { render json: @scheduled_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /scheduled_groups/1
  # PATCH/PUT /scheduled_groups/1.json
  def update
    respond_to do |format|
      if @scheduled_group.update(scheduled_group_params)
        format.html { redirect_to @scheduled_group, notice: 'Scheduled group was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @scheduled_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /scheduled_groups/1
  # DELETE /scheduled_groups/1.json
  def destroy
    @scheduled_group.destroy
    respond_to do |format|
      format.html { redirect_to scheduled_groups_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_scheduled_group
      @scheduled_group = ScheduledGroup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def scheduled_group_params
      params.require(:scheduled_group).permit(:schedule_id)
    end
end
