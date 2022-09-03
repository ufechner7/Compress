using CodecXz

function decompress(input, output)
    stream = open(input)
    output = open(output,"w")
    write(output, read(XzDecompressorStream(stream)))
    close(stream)
    close(output)
end