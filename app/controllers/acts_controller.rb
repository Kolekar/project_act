class ActsController < ApplicationController
  def search
    
  end
	def index
    @acts = Act.all
   


    respond_to do |format|
      format.html # index.html.erb

      format.json { 
                    @act_hash=Hash.new
             
                    @string=" "
                     @acts.each do |act|
                            @string = act.name + "  " 
                            @words = @string.split(/\W+/)
                            @words.each do|word|
                                 
                                    
                                   if @act_hash[word].blank? 
                                     @act_hash[word]=[[0]=>act.id] 
                                      @act_hash[word][0]=act.id 
                               else
                                 @act_hash[word][ @act_hash[word].length]=act.id   
                                end
                                     

                            end
                    end
                 
        render json: @act_hash 


      }
      
    end
  end

def show
@act=Act.find(params[:id])

 respond_to do |format|
      format.html # index.html.erb
    if !params[:search].blank? 
     

      format.json { 
                    @act_hash=Hash.new
             
                    @string=" "
                     @act.topics.each do |act|
                            @string = act.name + "  " + act.description
                            @words = @string.split(/\W+/)
                            @words.each do|word|
                                 
                                    
                                   if @act_hash[word].blank? 
                                     @act_hash[word]=[[0]=>act.id] 
                                      @act_hash[word][0]=act.id 
                               else
                                 @act_hash[word][ @act_hash[word].length]=act.id   
                                end
                                     

                            end
                    end
                 
        render json: @act_hash 


     }
    else
      format.json 
      end
    end
end
  # GET /acts/new
  # GET /acts/new.json
  def new
    
    @act = Act.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @act }
    end
  end

  # GET /acts/1/edit
  def edit
    
    @act = Act.find(params[:id])
  end

  # POST /acts
  # POST /acts.json
  def create
    
    
    @act = Act.new(params[:act])
    
    
   
    respond_to do |format|
      if @act.save
        format.html { redirect_to acts_path, notice: 'act was successfully created.' }
        format.json { render json: acts_path, status: :created, location: @act }
      else
        format.html { render action: "new" }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /acts/1
  # PUT /acts/1.json
  def update
   
    @act = Act.find(params[:id])

    respond_to do |format|
      if @act.update_attributes(params[:act])
        format.html { redirect_to acts_path, notice: 'act was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @act.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /acts/1
  # DELETE /acts/1.json
  def destroy
    
    @act = Act.find(params[:id])
    @act.destroy

    respond_to do |format|
      format.html { redirect_to acts_path }
      format.json { head :no_content }
    end
  end

end
