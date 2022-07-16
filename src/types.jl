using Dates

struct Collection_Part
    adult::Bool
    backdrop_path::Union{Nothing,String}
    genre_ids::Vector{Int16}
end

struct Collection
    id::Int32
    name::String
    overview::String
    poster_path::String
    backdrop_path::String
end

struct Company
    description::String
    headquarters::String
    homepage::String
    id::Int32
    logo_path::String
    name::String
    origin_country::String
    parent::Union{Nothing,String}
end

struct Country
    iso_3166_1::String
    name::String
end

struct Genre
    id::Int16
    name::String
end


struct Movie
    adult::Bool
    backdrop_path::String
    belongs_to_collection::Collection
    budget::Int
    genres::Vector{Genre}
    homepage::String
    id::Int32
    imdbId::String
    original_language::String
    original_title::String
    overview::String
    popularity::Float32
    poster_path::String
    release_date::Date
    revenue::Int
    runtime::Int
    status::String
    tagline::String
    title::String
    video::Bool
    vote_average::Float64
    vote_count::Int
end
