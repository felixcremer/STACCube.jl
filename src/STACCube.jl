module STACCube
using Reexport
using STAC: STAC, Asset, Item
using STAC
using ArchGDAL: ArchGDAL as AG
using HTTP: HTTP
using JSON3: JSON3
ENV["AWS_NO_SIGN_REQUEST"] = "YES"

include("auxil.jl")
include("cube.jl")
export staccube

end
