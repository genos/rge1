use clap::Parser;
use rand::{rngs::SmallRng, Rng, SeedableRng};
use rayon::prelude::*;

/// rge1 in rust.
#[derive(Debug, Parser)]
#[command(version, about, long_about = None)]
struct Args {
    /// Number of runs to perform
    #[arg(long, short, default_value_t = 1_000_000)]
    num_runs: usize,
    /// Chunk size for processing
    #[arg(long, short, default_value_t = 128)]
    chunk_size: usize,
    /// PRNG Seed
    #[arg(long, short, default_value_t = 1729)]
    seed: u64,
}

fn main() {
    let args = Args::parse();
    let mut seeds = vec![0u64; args.num_runs];
    SmallRng::seed_from_u64(args.seed).fill(&mut seeds[..]);
    let x = seeds
        .into_par_iter()
        .fold_chunks(
            args.chunk_size,
            || (0.0, 0.0),
            |(n_old, mu_old), seed| {
                let mut rng = SmallRng::seed_from_u64(seed);
                let (mut x, mut t) = (0.0, 0.0);
                while t < 1.0 {
                    x += 1.0;
                    t += rng.random::<f64>();
                }
                let n = n_old + 1.0;
                let mu = mu_old + (x - mu_old) / n;
                (n, mu)
            },
        )
        .reduce(
            || (0.0, 0.0),
            |(n_a, mu_a), (n_b, mu_b)| {
                let n = n_a + n_b;
                let mu = mu_a + (mu_b - mu_a) * n_b / n;
                (n, mu)
            },
        )
        .1;
    println!("{x}");
}
