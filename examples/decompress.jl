using Compress

const filename=joinpath("data", "log_8700W_8ms.csv")

input = filename * ".xz"
output = filename
decompress(input, output)

# with do syntax
# 0.283475 seconds (23.43 k allocations: 22.348 MiB, 6.64% compilation time)

# without do syntax
# 0.286080 seconds (4.53 k allocations: 21.342 MiB, 2.18% compilation time)