require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  film_arr=[]
  response_string["results"].each_with_index do |char,index|
    if char["name"].downcase==character
      char["films"].each do |link|
      film_arr<<link
    end
    end
  end
film_info=[]
 films_array.each do |link|
    film_info<<JSON.parse(link)
end
end

def print_movies(films_hash)
  # some iteration magic and puts out the movies in a nice list
 films_hash.each_with_index do |film,index|
 puts "#{index+1}.#{films_hash.title}"
end

def show_character_movies(character)
  films_array = get_character_movies_from_api(character)
  print_movies(films_array)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
