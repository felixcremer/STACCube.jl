using STACCube
using STAC
using Test

@testset "STACCube.jl" begin
    cat = STAC.Catalog("https://explorer.digitalearth.africa/stac")
    lat_range = (-25, -26,)
    lon_range = (29,30)
    time_range = (DateTime(2018,01,01), DateTime(2018,01,02))
    search_results = collect(search(cat, "s1_rtc", lon_range, lat_range, time_range))
    item = search_results[1]
end