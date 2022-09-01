function Person(id::Integer)
    result = HTTP.get("$api3/person/$id"; query)
    if result.status ≠ 200
        throw(ArgumentError("id = $id produced status = $(result.status)"))
    end
    return JSON3.read(result.body, Person)
end

function latestperson()
    result = HTTP.get("$api3/person/latest"; query)
    if result.status ≠ 200
        throw(error("latestPerson GET request returned status = $(result.status)"))
    end
    return JSON3.read(result.body, Person)
end

function ExternalIds(id::Integer)
    result = HTTP.get("$api3/person/$id/external_ids"; query)
    if result.status ≠ 200
        throw(ArgumentError("id = $id produced status = $(result.status)"))
    end
    return JSON3.read(result.body, ExternalIds)
end

function PersonMovieCredits(id::Integer)
    result = HTTP.get("$api3/person/$id/movie_credits"; query)
    if result.status ≠ 200
        throw(ArgumentError("id = $id produced status = $(result.status)"))
    end
    return JSON3.read(result.body, PersonMovieCredits)
end

function _nmdtup(pc::PersonCast)
    (; id, release_date, popularity, character, title) = pc
    return (; id, release_date, popularity, character, title)
end

function filmography(id::Integer)
    tbl = Table(
        _nmdtup.(
            filter(
                pc -> something(pc.release_date, Date("0001-01-01")) > Date("0001-01-01") && !pc.adult,
                PersonMovieCredits(id).cast
            ),
        ),
    )
    return tbl[sortperm(tbl.popularity; rev=true)]
end

struct SixDegrees
    actors::Vector{NamedTuple{(:actid,:name,:movieid,:deg),Tuple{Int32, String, Int32, Int8}}}
    actorset::Set{Int32}
    movies::Vector{NamedTuple{(:movieid,:title,:actid,:deg), Tuple{Int32, String, Int32, Int8}}}
    movieset::Set{Int32}
end

function _addmovies!(sd::SixDegrees, id::Integer, deg::Int8)
    deg += 1
    try 
        for f in filmography(id)
            if f.id ∉ sd.movieset
                push!(sd.movieset, f.id)
                push!(sd.movies, (; movieid=f.id, title=f.title, actid=Int32(id), deg))
                for mc in MovieCredits(f.id).cast
                    if mc.id ∉ sd.actorset
                        push!(sd.actorset, mc.id)
                        push!(sd.actors, (; actid=mc.id, name=mc.name, movieid=f.id, deg))
                    end
                end
            end
        end
    catch
        Arrow.write("movies.arrow", sd.movies)
        Arrow.write("actors.arrow", sd.actors)
        rethrow()
    end
    return sd
end

function SixDegrees(id::Integer = 4724)
    id = Int32(id)
    result = SixDegrees(
        [(; actid=id, name=Person(id).name, movieid=zero(Int32), deg=zero(Int8))],
        Set(id),
        NamedTuple{(:movieid,:title,:actid,:deg), Tuple{Int32, String, Int32, Int8}}[],
        Set{Int32}(),
    )
    return _addmovies!(result, id, zero(Int8))
end
