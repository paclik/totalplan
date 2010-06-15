class TalksController < ApplicationController
  # GET /talks
  # GET /talks.xml
  
  navigation :talks
  
  def index
    @talks = Talk.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @talks }
    end
  end

  # GET /talks/1
  # GET /talks/1.xml
  def show
    @talk = Talk.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @talk }
    end
  end

  # GET /talks/new
  # GET /talks/new.xml
  def chngemail
    @talk = Talk.find(params[:id])
    #@contact = Contact.find(@talk.contact_id)
    #@contact.email = params[:email]
    #if @contact.update 	
    	#flash[:notice] = 'Contact email successfully updated.'
      #redirect_to :action => "edit", :id => params[:id]
    #else
        #redirect_to :action => "edit", :id => params[:id]
    # end
    
    #@talk.call_when_time = Time.now
    #@contact = Contact.find(params[:contact_id])
    #render  :text => @contact.last_name, :layout => true 
    Contact.update (@talk.contact_id,	 { :email => params[:email] })

    redirect_to :action => "edit", :id => params[:id]
  end
  
  def new
    @talk = Talk.new
    @talk.contact_id = params[:contact_id]
    
    #@talk.call_when_time = Time.now
   
    #@contact = Contact.find(params[:contact_id])
    #render  :text => "Nový hovor s kontaktem #{ @talk.contact.last_name }" , :layout => true 
    
  end

  # GET /talks/1/edit
  def edit
    @talk = Talk.find(params[:id])
    #render  :text => "format datumu  #{@formatter()}" , :layout => true 
    #render  :text => "editace hovoru s kontaktem #{@talk.contact.last_name}" , :layout => true 
   
  end

  # POST /talks
  # POST /talks.xml
  def create
    @talk = Talk.new(params[:talk])

    respond_to do |format|
      if @talk.save
        flash[:notice] = 'Talk was successfully created.'
        format.html { redirect_to(@talk) }
        format.xml  { render :xml => @talk, :status => :created, :location => @talk }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /talks/1
  # PUT /talks/1.xml
  def update
    @talk = Talk.find(params[:id])

    respond_to do |format|
      if @talk.update_attributes(params[:talk])
        flash[:notice] = 'Talk was successfully updated.'
        format.html { redirect_to(@talk) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @talk.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /talks/1
  # DELETE /talks/1.xml
  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy

    respond_to do |format|
      format.html { redirect_to(talks_url) }
      format.xml  { head :ok }
    end
  end
end
