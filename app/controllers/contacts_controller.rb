class ContactsController < ApplicationController
	if (RUBY_VERSION > '1.9') then require 'lib/mysql_utf8'
	end
	
	navigation :contacts
	
  # GET /contacts
  # GET /contacts.xml
  
   before_filter :require_user, :only => [:new, :show, :edit, :update, :index, :destroy, :create]
  
  def statistic
    @title="Statistika"
  	@contacts = Contact.all
    @pocetKontaktu = Contact.count
  	
    #render  :text => "Počet kontaktu #{@pocetKontaktu}" , :layout => true 
  end 
   
  def index
    ##@contacts = Contact.all
    @contacts = Contact.find(:all, :conditions => ['last_name LIKE ?', "%#{params[:search]}%"])

    @title="Přehled kontaktů"
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contacts }
      format.js #index.js.erb 
    end
  end
  
  # GET /contacts/1
  # GET /contacts/1.xml
  def show
    @contact = Contact.find(params[:id])
    @title="Kontakt"
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/new
  # GET /contacts/new.xml
  def new
    @title="Nový kontakt"
  	@contact = Contact.new
    @contact.age = 0;
    @contact.height = 0;
    @contact.weight = 0;
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact }
    end
  end

  # GET /contacts/1/edit
  def edit
    @title="Edituj kontakt"
  	@contact = Contact.find(params[:id])
  end

  # POST /contacts
  # POST /contacts.xml
  def create
    @contact = Contact.new(params[:contact])

    respond_to do |format|
      if @contact.save
        flash[:notice] = 'Contact was successfully created.'
        format.html { redirect_to(@contact) }
        format.xml  { render :xml => @contact, :status => :created, :location => @contact }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contacts/1
  # PUT /contacts/1.xml
  def update
    @contact = Contact.find(params[:id])

    respond_to do |format|
      if @contact.update_attributes(params[:contact])
        flash[:notice] = 'Contact was successfully updated.'
        format.html { redirect_to(@contact) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.xml
  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to(contacts_url) }
      format.xml  { head :ok }
    end
  end
end
