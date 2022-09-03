using CodecXz

const filename="data/log_8700W_8ms.csv"

function compress(input, output)
    open(input) do inp
        open(output,"w") do io
            write(io, read(XzCompressorStream(inp)))
        end
    end
end

input = filename 
output = filename * ".xz"
rm(output, force=true)
compress(input, output)
nothing