using STACCube
using STAC
using Test


@testitem "STACCube.jl" begin
    using STAC
    catalog = STAC.Catalog("https://explorer.digitalearth.africa/stac")
    lat_range = (-25, -26,)
    lon_range = (29,30)
    time_range = (DateTime(2018,01,01), DateTime(2018,01,09))
    search_results = collect(search(catalog, "s1_rtc", lon_range, lat_range, time_range))
    item = search_results[1]
end

@testset "Landsat Catalog" begin 
    collections = "landsat-8-c2-l2"
    time_range = (DateTime(2018,01,01), DateTime(2018,01,02))
    lon_range = (2.51357303225, 6.15665815596)
    lat_range = (49.5294835476, 51.4750237087)
    caturl = "https://planetarycomputer.microsoft.com/api/stac/v1"
    catalog = STAC.Catalog(caturl)
    pycat = pystac.Catalog.from_file(caturl)
    search_results = collect(search(catalog, collections, lon_range, lat_range, time_range))
    item = search_results[1]
    blue = item.assets["SR_B2"]
end