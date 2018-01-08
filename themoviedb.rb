require 'themoviedb-api'

Tmdb::Api.key("d4c8d69cb34e0786caee04e54c18ae95")

def movie_search(movie)
  movie_results = Tmdb::Search.movie(movie).results
  titles = movie_results.collect { |x| x.title}
  ids = movie_results.collect { |x| x.id}
  overviews = movie_results.collect { |x| x.overview}
  release_years = movie_results.collect { |x| x.release_date[0..3]}
  posters = movie_results.collect { |x| x.poster_path}
  if movie_results != []
    movie = [ titles , ids , overviews, release_years, posters ]
  else
    movie = []
  end
end
