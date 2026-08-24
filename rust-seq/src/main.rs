use alea::Rng;
use argh::FromArgs;

/// Random ≥ 1 in Rust.
#[derive(FromArgs)]
struct Args {
    /// number of runs to perform
    #[argh(option, default = "1_000_000")]
    num_runs: usize,
    /// PRNG Seed
    #[argh(option, default = "1729")]
    seed: u64,
}

#[allow(clippy::cast_precision_loss)]
fn main() {
    let args: Args = argh::from_env();
    let rng = Rng::with_seed(args.seed);
    let mut x = 0.0;
    for _ in 0..args.num_runs {
        let mut t = 0.0;
        while t < 1.0 {
            x += 1.0;
            t += rng.f64();
        }
    }
    x /= args.num_runs as f64;
    println!("{x}");
}
