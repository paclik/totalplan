class TalksController < ApplicationController
  
  before_filter :require_user, :only => [:new, :show, :edit, :update, :index, :destroy, :create]
  navigation :talks
  
  
  $cookieHash = {"contacts.last_name"=>nil,"call_when_time1_d"=>nil,"call_when_time2_d"=>nil,
"productid"=>nil,"width"=>nil,"outtransport_id_n"=>nil}
  
 ########  private section   ######################### 
private
####################################################
#
#

def filter()
    processParams()
    @cookie = ""
    $cookieHash.each_key {| key |
    if $cookieHash[key] != nil then
    @cookie += " " + key+ " : " + cookies[key].to_s
    end     
    }   
    render :text => @cookie
     
    
end



# zpracuje parametry a vytvori condition a join retezec pro prikaz select
def processParams()
    readCookie()
    @condition = nil
    $cookieHash.each_key {| key |
    if params[key] != nil and params[key] != "" then 
      if @condition == nil  then
      	if key.slice(-2..-1) == "_d"  then
					case key.slice(-3..-3)
						when "1"
							@condition =  key.slice(0..-4) + " >= '#{DateTime.strptime(params[key],'%d.%m.%Y')}' "
						else
							@condition =  key.slice(0..-4) + " <= '#{DateTime.strptime(params[key],'%d.%m.%Y')+1}' "
					end	
        else
          @condition =  "(LOWER("+key+") LIKE " + "'%" + params[key].downcase.strip  + "%')" 
        
        end
      else
         if key.slice(-2..-1) == "_d"  then
          case key.slice(-3..-3)
          when "1"
      			@condition =  @condition + " and " + key.slice(0..-4) + " >= '#{DateTime.strptime(params[key],'%d.%m.%Y')}' "
          else
          	@condition =  @condition + " and " + key.slice(0..-4) + " <= '#{DateTime.strptime(params[key],'%d.%m.%Y')+1}' "
          end	
        else
           	@condition =  @condition + " and " + "(LOWER("+key+") LIKE " + "'%" + params[key].downcase.strip  + "%')" 
        
        end
      end 
      end 
      
    }  
     
    
end

def readCookie()
  
  
  $cookieHash.each_key {| key |
    $cookieHash[key] = params[key]
    if $cookieHash[key] == nil then
          $cookieHash[key] = cookies[key]
      else
          cookies[key] = $cookieHash[key]
          
      end
       params[key] = $cookieHash[key]
        
  }  

  
   
end

# 
# 
########  public section   ######################### 
public 
####################################################
#

def search
    
    filter()
    
    #render :text => params
  end

def delsearch()

  $cookieHash.each_key {| key |
      $cookieHash[key] = nil
        cookies[key] = nil
          params[key] = nil
  }  
  
  redirect_to :action => 'index'

end

  def ajax_respond_date
  	
    @timeref = DateTime.new
  	if !params[:p_date_and_time].empty?  then
  		@datumlistu = DateTime.strptime(params[:p_date_and_time],'%d.%m.%Y') 
  		@timeref = @datumlistu
  		@timemin = @timeref
  		@timemax = @timeref + 1
  
  		@conditions = "call_when_time >= '#{@timemin}' and call_when_time < '#{@timemax}'"
  	else  
  		@timeref = ""
  		@timemin = ""
  		@timemax = ""
  		@conditions = ""
  	end	
  	
    @talks = Talk.find(:all, :conditions => @conditions, :order => "call_when_time DESC")
    #render :text => @conditions
    render :partial => "index"

  end
  
  def ajax_respond_start_talk 
  	@talk = Talk.find(params[:id])
  	Talk.update (@talk,{ :start_time => Time.now })
  	@talk = Talk.find(params[:id])
   	render  :text => @talk.start_time.localtime.strftime("%d-%m-%Y | %H.%M.%S") ,  :layout => false
   	 
  end	
  
  def ajax_respond_stop_talk 
  	@talk = Talk.find(params[:id])
  	Talk.update (@talk,{ :end_time => Time.now })
  	@talk = Talk.find(params[:id])
   	render  :text => @talk.end_time.localtime.strftime("%d-%m-%Y | %H.%M.%S") ,  :layout => false
   	 
  end	
  
  def ajax_respond_clear 
  	result_string = '<span><img src="/images/ajax-loader.gif" />Vyhledávám..</span>'
  	render  :text => result_string,  :layout => false
  	#render :file => 'TimeAdd.png', :type => 'image/png',  :layout => false
  	#send_file 'public/images/TimeAdd.png', :type => 'image/png', :disposition => 'inline', :filename => "site-stats.png"
  	#send_file '/path/to.jpeg', :type => 'image/jpeg', :disposition => 'inline'

  end	
  	
  def index 
  	processParams()
  	page = params[:page] || 1
  	DateTime.strptime(params[:call_when_time1_d],'%d.%m.%Y') 
  	
  	@timeref = DateTime.new
  	if params[:datsearch] then
  		@timeref = DateTime.strptime(params[:datsearch],'%Y-%m-%d') 
  		@timemin = @timeref
  		@timemax = @timeref + 1
  		@conditions = @condition + " and call_when_time >= '#{@timemin}' and call_when_time < '#{@timemax}'"
  		@title = "Výpis hovorů dne: " +   @timeref.strftime("%d.%m.%Y")
  	else  
  		@timeref = ""
  		@timemin = ""
  		@timemax = ""
  		if @condition != nil then @conditions = @condition + " "  else @conditions = " " end
  		@title = "Výpis všech hovorů"
  	end	
  	#@items = Item.paginate :page => page, :order => "id desc", :conditions => @condition
    @talks = Talk.paginate :page => params[:page], :conditions => @conditions, :joins => [:contact], :order => "call_when_time DESC"
    	#render :text => @conditions
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @talks }
      end
  end
  
  
  # GET /talks/1
  # GET /talks/1.xml
  def show
    @talk = Talk.find(params[:id])
     @title="Hovor"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @talk }
    end
  end

  # GET /talks/new
  # GET /talks/new.xml
  def chngemail
    #@talk = Talk.find(params[:id])
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
    #Contact.update (@talk.contact_id,	 { :email => params[:email] })
    @datum = params[:hovor]
    @datven = ""
    @datum.each_value {|value| @datven +=  "value is #{value}" }
    
    redirect_to :action => "index"
    #render  :text => @datven,  :layout => true   	
    #	params[:hovor]["kdy(1i)"] 
    #redirect_to :action => "edit", :id => params[:id]
  end
  
  def listaccdate
    @datum = params[:hovor]
    @datven = ""
    @datum.each_value {|value| @datven +=  "#{value}-" }
    
    #render  :text => @datven,  :layout => true  
    
    redirect_to :action => "index", :datsearch => @datven
   
  end
  
  def new
    @talk = Talk.new
    @talk.contact_id = params[:contact_id]
    @title="Nový hovor"
    #@talk.call_when_time = Time.now
   
    #@contact = Contact.find(params[:contact_id])
    #render  :text => "Nový hovor s kontaktem #{ @talk.contact.last_name }" , :layout => true 
    
  end

  # GET /talks/1/edit
  def edit
    @talk = Talk.find(params[:id])
    @title="Edituju hovor"
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
    if (params[:email] != @talk.contact.email) then 
    	Contact.update(@talk.contact_id,{:email=>params[:email]})
    	@talk.contact.email = params[:email]
    end	
    respond_to do |format|
      if @talk.update_attributes(params[:talk])
        flash[:notice] = 'Talk was successfully updated.'
        #format.html { redirect_to(@talk) }
        format.html { redirect_to :back }
        #format.html { render :action => "show" }
        format.xml  { head :ok }
      else
        format.html { render :action => "show" }
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
