class LeaguesController < ApplicationController
  load_and_authorize_resource

  # GET /leagues
  # GET /leagues.json
  def index
    @leagues = League.where(:active => true)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @leagues }
    end
  end

  # GET /leagues/1
  # GET /leagues/1.json
  def show
    @league = League.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @league }
    end
  end

  # GET /leagues/new
  # GET /leagues/new.json
  def new
    @league = League.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @league }
    end
  end

  # GET /leagues/1/edit
  def edit
    @league = League.find(params[:id])
  end

  # POST /leagues
  # POST /leagues.json
  def create
    @league = League.new(params[:league])
    @league.game = Game.find(params[:game_id])

    respond_to do |format|
      if @league.save
        format.html { redirect_to @league, notice: 'League was successfully created.' }
        format.json { render json: @league, status: :created, location: @league }
      else
        format.html { render action: "new" }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /leagues/1
  # PUT /leagues/1.json
  def update
    @league = League.find(params[:id])

    params[:admins] ||= []
    current_admins = User.with_role(:league_admin, @league).map { |league| league.id.to_s } || []
    new_admins = params[:admins] - current_admins
    deleted_admins = current_admins - params[:admins]

    new_admins.each { |new_admin_id| @league.add_admin User.find(new_admin_id) }
    deleted_admins.each { |deleted_admin_id| @league.remove_admin User.find(deleted_admin_id) }

    respond_to do |format|
      if @league.update_attributes(params[:league])
        format.html { redirect_to @league, notice: 'League was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @league.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /leagues/1
  # DELETE /leagues/1.json
  def destroy
    @league = League.find(params[:id])
    @league.destroy

    respond_to do |format|
      format.html { redirect_to leagues_url }
      format.json { head :no_content }
    end
  end
end
