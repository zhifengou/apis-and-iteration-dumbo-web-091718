require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)

  # NOTE: in this demonstration we name many of the variables _hash or _array.
  # This is done for educational purposes. This is not typically done in code.


  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
  film_links=[]
    films_hash["result"].each do |character|
      if character["name"]==character
        character["films"].each do |link|
        film<<link
      end
    end
    film_info=[]
    film_links.each do |hash|
      film_info<< JSON.parse(RestClient.get(hash))
    end
end

def print_movies(films_hash)
  # some iterati  on magic and puts out the movies in a nice li st
  films_hash.each_with_index do |film_hash,index|
    puts "#{index+1}.#{film_hash["title"]}"
end
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
