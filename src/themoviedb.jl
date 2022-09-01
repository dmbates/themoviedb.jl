module themoviedb

using Arrow
using HTTP
using JSON3
using TypedTables

include("types.jl")
include("search.jl")
include("collection.jl")
include("genre.jl")
include("company.jl")
include("movie.jl")
include("person.jl")

const query = Dict{String,String}("api_key" => ENV["TMDB_API_KEY"])
const api3 = "https://api.themoviedb.org/3"

export Collection,
    Company,
    Country,
    Date,
    ExternalIds,
    Genre,
    Genres,
    Movie,
    MovieCast,
    MovieCredits,
    MovieCrew,
    Person,
    PersonCast,
    PersonCrew,
    PersonMovieCredits,
    SearchCollection,
    SixDegrees,

    filmography,
    latestperson,
    sixdegrees
end
