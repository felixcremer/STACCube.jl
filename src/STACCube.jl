module STACCube
using Reexport
using STAC: STAC, Asset, Item
using STAC
ENV["AWS_NO_SIGN_REQUEST"] = "YES"

include("cube.jl")
export staccube

end
