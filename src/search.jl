function SearchCollection(qry::AbstractString)
    local query = copy(themoviedb.query)
    query["query"] = qry
    result = HTTP.get("$api3/search/collection"; query)
    result.status == 200 || throw(error("HTTP status = $(result.status)"))
    return JSON3.read(result.body, SearchCollection)
end
