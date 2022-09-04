using CodecXz

const filename=joinpath("data", "log_8700W_8ms.csv")

function decompress1(input, output)
    stream = open(input)
    output = open(output,"w")
    write(output, read(XzDecompressorStream(stream)))
    close(stream)
    close(output)
end

function decompress(input, output)
    open(input) do inp
        open(output,"w") do out
            write(out, read(XzDecompressorStream(inp)))
        end
    end
    nothing
end

input = filename * ".xz"
output = filename
decompress1(input, output)

# with do syntax
# 0.283475 seconds (23.43 k allocations: 22.348 MiB, 6.64% compilation time)

# without do syntax
# 0.286080 seconds (4.53 k allocations: 21.342 MiB, 2.18% compilation time)