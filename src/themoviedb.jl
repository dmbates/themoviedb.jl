module themoviedb

using HTTP
using JSON3

include("types.jl")

const query = Dict{String,String}("api_key" => ENV["TMDB_API_KEY"])

function getmovie(id::Integer)
    resp = HTTP.get("https://api.themoviedb.org/3/movie/$id"; query)
    if (resp.status ≠ 200)
        throw(ArgumentError("id = $id returned status = $(resp.status)"))
    end
    return JSON3.read(resp.body)
end

end