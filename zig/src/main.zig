const std = @import("std");

pub fn main() !void {
    var rng = std.Random.DefaultPrng.init(1729);
    var x: f64 = 0;
    for (0..1e6) |_| {
        var total: f64 = 0;
        while (total < 1) {
            total += rng.random().float(f64);
            x += 1;
        }
    }
    x /= 1e6;
    try std.io.getStdOut().writer().print("{d}\n", .{x});
}
