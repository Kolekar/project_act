
class TopicsController < ApplicationController
  
  def index
if !params[:chapter].blank? 
      
      @topics= Topic.find_all_by_chapter_id( params[:chapter] )
    else
    @topics = Topic.all
  end

    
   
    respond_to do |format|
      format.html # index.html.erb

      format.json { 

                     @topic_hash=Hash.new
             
                    @string=" "
                     @topics.each do |topic|
                            @string = topic.name + "  " + topic.description
                            @words = @string.split(/\W+/)
                            @words.each do|word|
                                 
                                    
                                   if @topic_hash[word].blank? 
                                     @topic_hash[word]=[[0]=>topic.id] 
                                      @topic_hash[word][0]=topic.id 
                               else
                                 @topic_hash[word][ @topic_hash[word].length]=topic.id   
                                end
                                     

                            end
                    end
        render json: @topic_hash }
      format.xml # index.html.erb
    end
  end

  # GET /topics/1
  # GET /topics/1.json
  def show
    
    @topic = Topic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.json
  def new
    if !params[:chapter].blank? 
      
      @chapters= Chapter.find_all_by_id( params[:chapter] )
    else
    @chapters=Chapter.all
  end


   
    @topic = Topic.new
   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @chapters=Chapter.all
    @topic = Topic.find(params[:id])
  end

  # POST /topics
  # POST /topics.json
  def create
    
    
    @topic = Topic.new(params[:topic])
    
    
   
    respond_to do |format|
      if @topic.save
        format.html { redirect_to @topic, notice: 'topic was successfully created.' }
        format.json { render json: @topic, status: :created, location: @topic }
      else
        format.html { render action: "new" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.json
  def update
   
    @topic = Topic.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to @topic, notice: 'topic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @topic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.json
  def destroy
    
    @topic = Topic.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to topics_url }
      format.json { head :no_content }
    end
  end
end

