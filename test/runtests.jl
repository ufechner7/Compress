using Test, Compress

cd("..")

# TODO: use mktempdir to create output folder

const filename=joinpath("data", "log_8700W_8ms.csv")

@testset "decompress:" begin
    input = filename * ".xz"
    output = filename
    bytes = decompress(input, output)
    @test bytes == 12758112
end

@testset "compress:" begin
    input = filename
    output = filename * ".xz"
    bytes = compress(input, output)
    @test bytes == 3618752
end