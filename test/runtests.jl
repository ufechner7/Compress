using Test, Compress

if basename(pwd()) == "test"
    cd("..")
end

const filename="log_8700W_8ms.csv"
outdir = mktempdir()

@testset "decompress:" begin
    input = joinpath("data", filename) * ".xz"
    output = joinpath(outdir, filename)
    bytes = decompress(input, output)
    @test bytes == 12758112
end

@testset "compress:" begin
    local sout, sorig
    input = joinpath(outdir, filename)
    output = joinpath(outdir, filename) * ".xz"
    bytes = compress(input, output)
    @test bytes == 3618752
    open(output) do out
        sout = read(out, String)
    end
    orig = joinpath("data", filename) * ".xz"
    open(orig) do or
        sorig = read(or, String)
    end
    # test that the file that was first decompressed and than compressed is identical with the original file
    @test sout == sorig
end

println(outdir)