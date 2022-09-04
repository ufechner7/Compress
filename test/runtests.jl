using Test, Compress

cd("..")

const filename="log_8700W_8ms.csv"
outdir = mktempdir()

@testset "decompress:" begin
    input = joinpath("data", filename) * ".xz"
    output = joinpath(outdir, filename)
    bytes = decompress(input, output)
    @test bytes == 12758112
end

@testset "compress:" begin
    input = joinpath(outdir, filename)
    output = joinpath(outdir, filename) * ".xz"
    bytes = compress(input, output)
    @test bytes == 3618752
end