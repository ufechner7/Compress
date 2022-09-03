using CodecXz

const filename=joinpath("data", "log_8700W_8ms.csv")

function decompress(input, output)
    stream = open(input)
    output = open(output,"w")
    write(output, read(XzDecompressorStream(stream)))
    close(stream)
    close(output)
end

input = filename * ".xz"
output = filename
decompress(input, output)