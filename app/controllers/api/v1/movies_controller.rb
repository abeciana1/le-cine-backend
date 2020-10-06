class Api::V1::MoviesController < ApplicationController
    
    def index
        movies = Movie.all
        render :json => movies, each_serializer: MoviesSerializer
    end
    
    def show
        movie = Movie.find(params[:id])
        render :json => movie, each_serializer: MovieSerializer
    end
    
    def create
        movie = Movie.create(movie_params)
        if movie.valid?
            render json: {movie: Movie.new(movie)}, status: :created
        else
            render json: { error: 'failed to add movie'}, status: :not_acceptable
        end
    end
    
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
        params.require(:movie).permit(:backdrop_image, :title, :poster, :genres, :tmdb_id, :imdb_id, :trailer, :tagline, :plot, :runtime, :language, :release_date)
    end
    
    
end
