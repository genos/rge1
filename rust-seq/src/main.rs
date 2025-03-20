use clap::Parser;
use rand::{rngs::SmallRng, Rng, SeedableRng};

/// Random ≥ 1 in Rust.
#[derive(Debug, Parser)]
#[command(version, about, long_about = None)]
struct Args {
    /// Number of runs to perform
    #[arg(long, short, default_value_t = 1_000_000)]
    num_runs: usize,
    /// PRNG Seed
    #[arg(long, short, default_value_t = 1729)]
    seed: u64,
}

#[allow(clippy::cast_precision_loss)]
fn main() {
    let args = Args::parse();
    let mut rng = SmallRng::seed_from_u64(args.seed);
    let mut x = 0.0;
    for _ in 0..args.num_runs {
        let mut t = 0.0;
        while t < 1.0 {
            x += 1.0;
            t += rng.random::<f64>();
        }
    }
    x /= args.num_runs as f64;
    println!("{x}");
}
