using Compress

const filename=joinpath("data", "log_8700W_8ms.csv")

input = filename 
output = filename * ".xz"
rm(output, force=true)
compress(input, output)