require 'net/http'

class ConsumersController < ApplicationController
  before_action :set_consumer, only: [:show, :edit, :update, :destroy]

  # GET /consumers
  # GET /consumers.json
  def index
    # Normally a request for data would be made
    #@results = Net::HTTP.get(URI.parse('/assets/sample_users.json'))
    @results = File.read(Rails.root.join("app", "assets", "sample_users.json"))
    @results = JSON.parse(@results)
  end

  # GET /consumers/1
  # GET /consumers/1.json
  def show
  end

  # GET /consumers/new
  def new
    @consumer = Consumer.new
  end

  # GET /consumers/1/edit
  def edit
  end

  # POST /consumers
  # POST /consumers.json
  def create
    @consumer = Consumer.new(consumer_params)

    respond_to do |format|
      if @consumer.save
        format.html { redirect_to @consumer, notice: 'Consumer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @consumer }
      else
        format.html { render action: 'new' }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consumers/1
  # PATCH/PUT /consumers/1.json
  def update
    respond_to do |format|
      if @consumer.update(consumer_params)
        format.html { redirect_to @consumer, notice: 'Consumer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @consumer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consumers/1
  # DELETE /consumers/1.json
  def destroy
    @consumer.destroy
    respond_to do |format|
      format.html { redirect_to consumers_url }
      format.json { head :no_content }
    end
  end

  def submit_pledge
    if (params[:social_data] && params[:token])
      social_data = JSON.parse(params[:social_data])
      email_exists = does_email_exist(social_data["email"])
      if email_exists
        provider = Provider.new(:token => params[:token], :social_data => params[:social_data])
        accountTotal = "335.85"
      else
        consumer = Consumer.new(:crm_id => "25")
        provider = Provider.new(:token => params[:token], :social_data => params[:social_data])
      end
    end

    if consumer && consumer.save
    else
      #render json: {:statusMessage => "Could not save user" }, status: 400
    end

    if provider && provider.save
        render json: {:data => {:accountTotal => (accountTotal || '') }}
    else
        render json: {:statusMessage => "Could not save provider" }, status: 400
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consumer
      @consumer = Consumer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def consumer_params
      params.require(:consumer).permit(:crm_id)
    end

    def short_to_long_token_conversion

    end

    def does_email_exist(email)
      @results = File.read(Rails.root.join("app", "assets", "sample_users.json"))
      @results = JSON.parse(@results)
      matched = false

      @results.each do |consumer|
        if consumer[1]["email"] == email
          matched = consumer
        end
      end
      return matched
    end
end
