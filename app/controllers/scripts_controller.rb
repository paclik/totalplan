class ScriptsController < ApplicationController
  
	
	if (RUBY_VERSION > '1.9') then require 'lib/mysql_utf8'
	end
		
	navigation :scripts
	
	before_filter :require_user
	
	def statistic
    @contacts = Script.all
    @pocetKontaktu = Script.count
  	
    render  :text => "Pocet scenaru #{@pocetKontaktu}" , :layout => true 
  end 
	
	
	# GET /scripts
  # GET /scripts.xml
  def index
    @scripts = Script.all
    @title="Výpis skriptů"
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scripts }
    end
  end

  # GET /scripts/1
  # GET /scripts/1.xml
  def show
    @script = Script.find(params[:id])
    @title="Skript"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @script }
    end
  end

  # GET /scripts/new
  # GET /scripts/new.xml
  def new
    @script = Script.new
    @title="Nový skript"
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @script }
    end
  end

  # GET /scripts/1/edit
  def edit
    @title="Editace skriptu"
  	@script = Script.find(params[:id])
  end

  # POST /scripts
  # POST /scripts.xml
  def create
    @script = Script.new(params[:script])

    respond_to do |format|
      if @script.save
        flash[:notice] = 'Script was successfully created.'
        format.html { redirect_to(@script) }
        format.xml  { render :xml => @script, :status => :created, :location => @script }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scripts/1
  # PUT /scripts/1.xml
  def update
    @script = Script.find(params[:id])

    respond_to do |format|
      if @script.update_attributes(params[:script])
        flash[:notice] = 'Script was successfully updated.'
        format.html { redirect_to(@script) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scripts/1
  # DELETE /scripts/1.xml
  def destroy
    #@script = Script.find(params[:id])
    #@script.destroy

    respond_to do |format|
      format.html { redirect_to(scripts_url) }
      format.xml  { head :ok }
    end
  end
end
