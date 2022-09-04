using Test, Compress

cd("..")

const filename=joinpath("data", "log_8700W_8ms.csv")

input = filename * ".xz"
output = filename
decompress(input, output)