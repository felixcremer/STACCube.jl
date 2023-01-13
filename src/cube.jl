using YAXArrayBase
using YAXArrays 
using Dim

const rastertypes = ["image/tiff"]
checkraster(asset::Asset) = checkraster(type(asset))
checkraster(::Any) = false
checkraster(assettype::String) = any(startswith.(Ref(assettype), rastertypes))


function staccube(item::STAC.Item, token)
    assetcubes = Dict()
    for asset in values(item.assets)
        if checkraster(asset)
            uri = signed_uri(asset, token)
            yax = YAXArray(AG.readraster(string("/vsicurl/", uri)) )
            push!(assetcubes,Symbol(title(asset)) => yax)
            #@show asset
        end
    end
    varax = CategoricalAxis("Title", [first(it) for it in item.assets if checkraster(last(it))])

    ds = Dataset(;assetcubes...)
    return Cube(ds)
end