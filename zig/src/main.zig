const std = @import("std");

fn single(rng: std.Random) f64 {
    var total: f64 = 0;
    var steps: f64 = 0;
    while (total < 1) {
        total += rng.float(f64);
        steps += 1;
    }
    return steps;
}

pub fn main() !void {
    var rng = std.Random.Pcg.init(1729);
    var x: f64 = 0;
    for (0..1_000_000) |_| {
        x += single(rng.random());
    }
    x /= 1_000_000;
    try std.io.getStdOut().writer().print("{d}.\n", .{x});
}
