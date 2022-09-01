function Movie(id::Integer)
    resp = HTTP.get("$api3/movie/$id"; query)
    if resp.status ≠ 200
        throw(ArgumentError("id = $id returned status = $(resp.status)"))
    end
    return JSON3.read(resp.body, Movie)
end

function MovieCredits(id::Integer)
    resp = HTTP.get("$api3/movie/$id/credits"; query)
    if resp.status ≠ 200
        throw(ArgumentError("id = $id returned status = $(resp.status)"))
    end
    return JSON3.read(resp.body, MovieCredits)
end
