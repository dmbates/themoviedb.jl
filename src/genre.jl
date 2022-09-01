function Genres()
    result = HTTP.get("$api3/genre/movie/list"; query)
    if result.status ≠ 200
        throw(error("genres query returned status = $(result.status)"))
    end
    return JSON3.read(result.body, Genres)
end
