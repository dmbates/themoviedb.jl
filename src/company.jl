function Company(id::Integer)
    result = HTTP.get(string("$api3/company/", id); query)
    if result.status ≠ 200
        throw(ArgumentError("id = $id returned status = $(result.status)"))
    end
    return JSON3.read(result.body, Company)
end
