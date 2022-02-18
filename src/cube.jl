using YAXArrayBase
using YAXArrays 

const rastertypes = ["image/tiff"]
checkraster(asset::Asset) = checkraster(type(asset))
checkraster(::Any) = false
checkraster(assettype::String) = any(startswith.(Ref(assettype), rastertypes))

function staccube(item::STAC.Item)
    rasterassets = [] 
    for asset in values(item.assets)
        if checkraster(asset)
            push!(rasterassets,asset)
            @show asset
        end
    end
    varax = CategoricalAxis("Title", title.(rasterassets))
    rasterassets
end

function vsicurl(hrefurl) 
    split(vsi)
end