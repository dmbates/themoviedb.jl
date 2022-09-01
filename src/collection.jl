function Collection(id::Int)
    result = HTTP.get(string(api3, "/collection/", id); query)
    result.status == 200 || throw(error("HTTP status = $(result.status)"))
    return JSON3.read(result.body, Collection)
end
