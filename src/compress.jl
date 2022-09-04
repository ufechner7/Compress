using CodecXz

const filename=joinpath("data", "log_8700W_8ms.csv")

function compress(input, output)
    open(input) do inp
        open(output,"w") do out
            write(out, read(XzCompressorStream(inp)))
        end
    end
    nothing
end

input = filename 
output = filename * ".xz"
rm(output, force=true)
compress(input, output)