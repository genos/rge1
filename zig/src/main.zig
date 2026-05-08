const std = @import("std");

pub fn main() !void {
    const n = 1e6;
    var rng = std.Random.DefaultPrng.init(1729);
    var x: f64 = 0;
    for (0..n) |_| {
        var total: f64 = 0;
        while (total < 1) : (x += 1) total += rng.random().float(f64);
    }
    x /= n;
    std.debug.print("{d}\n", .{x});
}
