module Compress

using CodecXz

export compress, decompress

function compress(input, output)
    open(input) do inp
        open(output,"w") do out
            write(out, read(XzCompressorStream(inp)))
        end
    end
end

function decompress(input, output)
    open(input) do inp
        open(output,"w") do out
            write(out, read(XzDecompressorStream(inp)))
        end
    end
end

end