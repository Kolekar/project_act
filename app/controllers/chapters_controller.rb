class ChaptersController < ApplicationController

	def index

    if !params[:act].blank? 
      
      @chapters= Chapter.find_all_by_act_id( params[:act] )
    else
    @chapters = Chapter.all
  end
   

    respond_to do |format|
      format.html # index.html.erb

      format.json { 

                     @act_hash=Hash.new
                     @string=" "
                     @chapters.each do |chapter|
                            @string = chapter.name + "  " 
                            @words = @string.split(/\W+/)
                            @words.each do|word|
                                 
                                    
                                   if @act_hash[word].blank? 
                                     @act_hash[word]=[[0]=>chapter.id] 
                                      @act_hash[word][0]=chapter.id 
                               else
                                 @act_hash[word][ @act_hash[word].length]=chapter.id   
                                end
                                     

                            end
                    end

      render json: @act_hash }
      end
  end

  # GET /chapters/1
  # GET /chapters/1.json
  def show
    
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json 
    end
  end

  # GET /chapters/new
  # GET /chapters/new.json
  def new
    if !params[:act].blank? 
      
      @acts= Act.find_all_by_id( params[:act] )
    else
    @acts=Act.all
  end
   
    @chapter = Chapter.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chapter }
    end
  end

  # GET /chapters/1/edit
  def edit
    @acts=Act.all
    @chapter = Chapter.find(params[:id])
  end

  # POST /chapters
  # POST /chapters.json
  def create
    
    
    @chapter = Chapter.new(params[:chapter])
    
    
   
    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter, notice: 'chapter was successfully created.' }
        format.json { render json: @chapter, status: :created, location: @chapter }
      else
        format.html { render action: "new" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.json
  def update
   
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to @chapter, notice: 'chapter was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chapter.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    
    @chapter = Chapter.find(params[:id])
    @chapter.destroy

    respond_to do |format|
      format.html { redirect_to chapters_url }
      format.json { head :no_content }
    end
  end
end

