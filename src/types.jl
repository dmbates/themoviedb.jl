using Dates, StructTypes

struct Collection_Part
    adult::Bool
    backdrop_path::Union{Nothing,String}
    genre_ids::Vector{Int16}
    id::Int32
    original_language::String
    original_title::String
    overview::String
    release_date::Date
    poster_path::String
    popularity::Float32
    title::String
    video::Bool
    vote_average::Float32
    vote_count::Int
end

struct Collection
    adult::Union{Nothing,Bool}
    backdrop_path::Union{Nothing,String}
    id::Int32
    name::String
    original_language::Union{Nothing,String}
    original_name::Union{Nothing,String}
    overview::Union{Nothing,String}
    poster_path::Union{Nothing,String}
    parts::Vector{Collection_Part}
end

struct Company
    description::String
    headquarters::String
    homepage::String
    id::Int32
    logo_path::String
    name::String
    origin_country::String
    parent::Union{Nothing,Dict{Symbol,Any}}
end

struct Country
    iso_3166_1::String
    name::String
end

struct ExternalIds
    id::Int
    imdb_id::Union{Nothing,String}
    facebook_id::Union{Nothing,String}
    freebase_mid::Union{Nothing,String}
    freebase_id::Union{Nothing,String}
    tvrage_id::Union{Nothing,Int}
    twitter_id::Union{Nothing,String}
    instagram_id::Union{Nothing,String}
end

struct Genre
    id::Int16
    name::String
end

struct Genres
    genres::Vector{Genre}
end

struct Movie
    adult::Bool
    backdrop_path::Union{Nothing,String}
    belongs_to_collection::Union{Nothing,Dict{Symbol,Any}}
    budget::Int
    genres::Vector{Genre}
    homepage::Union{Nothing,String}
    id::Int
    imdb_id::String
    original_language::String
    original_title::String
    overview::Union{Nothing,String}
    popularity::Float64
    poster_path::Union{Nothing,String}
    production_companies::Vector{Dict{Symbol,Any}}
    production_countries::Vector{Country}
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

struct MovieCast
    adult::Bool
    gender::Union{Nothing,Int8}
    id::Int
    known_for_department::Union{Nothing,String}
    name::String
    original_name::String
    popularity::Float32
    profile_path::Union{Nothing,String}
    cast_id::Int
    character::Union{Nothing,String}
    credit_id::String
    order::Int32
end

struct MovieCrew
    adult::Bool
    gender::Union{Nothing,Int8}
    id::Int
    known_for_department::Union{Nothing,String}
    name::String
    original_name::String
    popularity::Float32
    profile_path::Union{Nothing,String}
    credit_id::String
    department::String
    job::String
end

struct MovieCredits
    id::Int
    cast::Vector{MovieCast}
    crew::Vector{MovieCrew}
end

struct PersonCast
    character::Union{Nothing,String}
    credit_id::String
    release_date::Union{Nothing,Date}
    vote_count::Union{Nothing,Int}
    video::Union{Nothing,Bool}
    adult::Union{Nothing,Bool}
    vote_average::Union{Nothing,Float64}
    title::String
    genre_ids::Union{Nothing,Vector{Int16}}
    original_language::String
    original_title::String
    popularity::Union{Nothing,Float64}
    id::Int
    backdrop_path::Union{Nothing,String}
    overview::Union{Nothing,String}
    poster_path::Union{Nothing,String}
end

struct PersonCrew
    id::Int
    credit_id::String
    department::String
    original_language::String
    original_title::String
    job::String
    overview::Union{Nothing,String}
    release_date::Union{Nothing,Date}
    vote_count::Union{Nothing,Int}
    video::Union{Nothing,Bool}
    vote_average::Union{Nothing,Float64}
    title::Union{Nothing,String}
    genre_ids::Union{Nothing,Vector{Int16}}
    popularity::Union{Nothing,Float64}
    backdrop_path::Union{Nothing,String}
    poster_path::Union{Nothing,String}
end

struct PersonMovieCredits
    cast::Vector{PersonCast}
    crew::Vector{PersonCrew}
    id::Int
end

struct Person
    birthday::Union{Nothing,Date}
    known_for_department::Union{Nothing,String}
    deathday::Union{Nothing,Date}
    id::Int
    name::String
    also_known_as::Vector{String}
    gender::Int8
    biography::Union{Nothing,String}
    popularity::Float64
    place_of_birth::Union{Nothing,String}
    profile_path::Union{Nothing,String}
    adult::Bool
    imdb_id::Union{Nothing,String}
    homepage::Union{Nothing,String}
end

struct SearchCollection
    page::Int32
    results::Vector{Collection}
    total_pages::Int32
    total_results::Int32
end

struct SearchPerson
    page::Int32
    results::Vector{Collection}
    total_pages::Int32
    total_results::Int32
end

StructTypes.StructType(::Type{Collection}) = StructTypes.Struct()
StructTypes.StructType(::Type{Collection_Part}) = StructTypes.Struct()
StructTypes.StructType(::Type{Company}) = StructTypes.Struct()
StructTypes.StructType(::Type{Country}) = StructTypes.Struct()
StructTypes.StructType(::Type{ExternalIds}) = StructTypes.Struct()
StructTypes.StructType(::Type{Genre}) = StructTypes.Struct()
StructTypes.StructType(::Type{Genres}) = StructTypes.Struct()
StructTypes.StructType(::Type{Movie}) = StructTypes.Struct()
StructTypes.StructType(::Type{MovieCast}) = StructTypes.Struct()
StructTypes.StructType(::Type{MovieCredits}) = StructTypes.Struct()
StructTypes.StructType(::Type{MovieCrew}) = StructTypes.Struct()
StructTypes.StructType(::Type{Person}) = StructTypes.Struct()
StructTypes.StructType(::Type{PersonCast}) = StructTypes.Struct()
StructTypes.StructType(::Type{PersonCrew}) = StructTypes.Struct()
StructTypes.StructType(::Type{PersonMovieCredits}) = StructTypes.Struct()
StructTypes.StructType(::Type{SearchCollection}) = StructTypes.Struct()
