using themoviedb
using Documenter

DocMeta.setdocmeta!(themoviedb, :DocTestSetup, :(using themoviedb); recursive=true)

makedocs(;
    modules=[themoviedb],
    authors="Douglas Bates <dmbates@gmail.com> and contributors",
    repo="https://github.com/dmbates/themoviedb.jl/blob/{commit}{path}#{line}",
    sitename="themoviedb.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://dmbates.github.io/themoviedb.jl",
        edit_link="main",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/dmbates/themoviedb.jl",
    devbranch="main",
)
