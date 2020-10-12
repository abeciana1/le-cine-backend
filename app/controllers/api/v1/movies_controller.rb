require 'pry'

class Api::V1::MoviesController < ApplicationController
    skip_before_action :authorized, only: [:index, :create, :search, :details]
    
    def index
        movies = Movie.all
        render :json => movies, each_serializer: MovieSerializer
    end

    def search
        title = Movie.results(params[:title])
        render json: title, except: [:created_at, :updated_at]
    end

    def details
        id = Movie.details(params[:tmdb_id])
        render json: id, except: [:created_at, :updated_at]
    end
    
    def show
        movie = Movie.find(params[:id])
        render :json => movie, each_serializer: MovieSerializer
    end
    
    def create
        # binding.pry
        
        # params[:backdrop_path] = "https://image.tmdb.org/t/p/original#{params["backdrop_path"]}"
        # params[:mov_id] = params[:id]
        # params[:poster_path] = "https://image.tmdb.org/t/p/w500#{params["poster_path"]}"
        
        
        movie_obj = params
        mov = {}
        mov["title"] = params["title"]
        mov[:backdrop_path] = "https://image.tmdb.org/t/p/original#{params["backdrop_path"]}"
        mov[:mov_id] = params[:id]
        mov[:poster_path] = "https://image.tmdb.org/t/p/w500#{params["poster_path"]}"
        mov["mov_id"] = params["id"]
        mov["overview"] = params["overview"]
        mov["original_language"] = params["original_language"]
        mov["release_date"] = params["release_date"]
        # binding.pry
        # movie = Movie.new(mov)
        movie = Movie.find_or_create_by(mov)
        # binding.pry
        if movie.valid?
            # movie[:backdrop_path] = "https://image.tmdb.org/t/p/original#{params["backdrop_path"]}"
            # movie[:poster_path] = "https://image.tmdb.org/t/p/w500#{params["poster_path"]}"
            # Movie.find_or_create_by(mov_id: mov["mov_id"])
            # movie.save
            # binding.pry
            # render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
            render json: { movie: MovieSerializer.new(movie)}, status: :created
        else
            render json: { error: 'failed to add movie'}, status: :not_acceptable
        end
    end

    # def create
    #     # find or initialize the record
    #     @game_date = GameDate.find_or_initalize_by(date: game_date_params[:date]) do |game_date|
    #       # Accept nested attributes as well
    #       game_date.assign_attributes(game_date_params)
    #     end
      
    #     if @game_date.save
    #       redirect_to showcases_path
    #       flash[:success] = "Game date created"
    #     else
    #       render 'new'
    #     end
    #   end
    
    def update
        movie = Movie.find(params[:id])
        movie.update(movie_params)
        render :json => movie, each_serializer: MovieSerializer
    end
    
    def delete
        movie = Movie.find(params[:id])
        movie.destroy
        render json: {}
    end
    
    private
    
    def movie_params
        # params.require(:movie).permit(:backdrop_path, :title, :poster_path, :mov_id, :overview, :original_language, :release_date)
        params.permit(:backdrop_path, :title, :poster_path, :mov_id, :overview, :original_language, :release_date)
    end
    
    
end
