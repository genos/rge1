const std = @import("std");

pub fn main() !void {
    var rng = std.Random.DefaultPrng.init(1729);
    var x: f64 = 0;
    for (0..1_000_000) |_| {
        var total: f64 = 0;
        while (total < 1) {
            total += rng.random().float(f64);
            x += 1;
        }
    }
    x /= 1_000_000;
    try std.io.getStdOut().writer().print("{d}\n", .{x});
}
