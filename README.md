# STACCube.jl

This package is a bridge between STAC.jl and YAXArrayBase. 
The aim is to make it as seamless as possible to work with STAC provided data as a data cube in whichever named axis array type you want. 

We would need to decide, where this code is going to live in the end, but for experimentation this is going to start in its own package. 

With this package you can construct a YAXArray from a STAC.Item. 
In this example we are going to construct a Dataset of different landsat-8 time steps into a YAXArrays.Dataset 

```julia

using STAC, STACCube
using YAXArrays

caturl = "https://planetarycomputer.microsoft.com/api/stac/v1"
catalog = STAC.Catalog(caturl)

collections = "landsat-8-c2-l2"

time_range = (DateTime(2018,01,01), DateTime(2019,01,02))
lon_range = (2.51357303225, 6.15665815596)
lat_range = (49.5294835476, 51.4750237087)
search_results = collect(search(catalog, collections, lon_range, lat_range, time_range))

token, expiry = STACCube.sas_token(collections)

ds = Dataset(;[Symbol(it.data.id) => staccube(it, token) for it in search_results]...)
```

