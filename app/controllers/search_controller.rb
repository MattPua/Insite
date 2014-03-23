class SearchController < ApplicationController
  
  def index

# Herein lies my overlycomplicated multisearching system. Essentially, I break down the search words entered into user_search into individual strings.
# From there, I go through each word and retrieve all the objects that match up with that search word.
# Moving from there, I remove duplicates, and for each of the objects retrieved from searching, I determine the type
# of object, and find the relevant users corresponding to the type of object. 
# Tricky part is when you get to trying to do refined searches with multiple keywords. That's a whole bunch of 
# stuff that's like bananzas
  @docs=Array.new
  if params[:user_search].present?
    @searchWords = params[:user_search].split(" ")
    @searchWords.each do |search|                 
      @docs.push(PgSearch.multisearch(search))      #Grabbing all the objects that match the keywords from search
    end
  end

  @users=Array.new
  @docs.flatten!      #separate all the objects in the @docs into separate objects in case arrays existed within
  @docs.uniq!         #Remove all the duplicates
  @docs.sort!         #sorted them, but not sure if necessary
  if params[:user_search].empty?    
    @users=[]
  elsif @searchWords.count==1  
      @docs.each do |doc|
        if doc.searchable_type == "User"
          @users.push(doc.searchable)
        elsif doc.searchable_type =="Company"
         @users= @users | doc.searchable.users
        elsif doc.searchable_type =="Interview"
          @users.push(doc.searchable.user)
        end
      end
  else                #multiple search words
    iteration = 0
    @RefinedSearch=Array.new
    @InterviewResults=Array.new
    @docs.each do |doc|
      if iteration == 0
        if doc.searchable_type == "User"
          @users.push(doc.searchable)
          iteration=1
        elsif doc.searchable_type =="Company"
          @users= @users | doc.searchable.users
          iteration=1
        elsif doc.searchable_type =="Interview"
          @users.push(doc.searchable.user)
          iteration=1
        end
      else
        if doc.searchable_type == "User"
          @RefinedSearch=[doc.searchable]
          @users=@users & @RefinedSearch
        elsif doc.searchable_type =="Company"
          @users=@users & doc.searchable.users    
        elsif doc.searchable_type =="Interview" #not fully tested
          if @users.include?(doc.searchable.user)
            @InterviewResults.push(doc.searchable.user)
          end
        end
      end
    end
   end
   if !@InterviewResults.nil?
    @users=@users & @InterviewResults
   end
   @users.sort!{ |a,b| a.name.downcase<=> b.name.downcase}

   @users = @users.paginate(:page => params[:page], :per_page => 12)
    

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @searchResult }
    end
  end
end
