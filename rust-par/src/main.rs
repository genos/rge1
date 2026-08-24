use alea::Rng;
use argh::FromArgs;
use rayon::prelude::*;

/// Random ≥ 1 in Rust.
#[derive(FromArgs)]
struct Args {
    /// number of runs to perform
    #[argh(option, default = "1_000_000")]
    num_runs: usize,
    /// chunk size for processing
    #[argh(option, default = "128")]
    chunk_size: usize,
    /// PRNG Seed
    #[argh(option, default = "1729")]
    seed: u64,
}

fn merge((n_a, mu_a): (f64, f64), (n_b, mu_b): (f64, f64)) -> (f64, f64) {
    let n = n_a + n_b;
    (n, mu_a + (mu_b - mu_a) * n_b / n)
}

fn main() {
    let args: Args = argh::from_env();
    let mut seeds = vec![0u64; args.num_runs];
    let rng = Rng::with_seed(args.seed);
    for s in &mut seeds {
        *s = rng.u64();
    }
    let x = seeds
        .into_par_iter()
        .fold_chunks(
            args.chunk_size,
            || (0.0, 0.0),
            |acc, seed| {
                let rng = Rng::with_seed(seed);
                let (mut x, mut t) = (0.0, 0.0);
                while t < 1.0 {
                    x += 1.0;
                    t += rng.f64();
                }
                merge(acc, (1.0, x))
            },
        )
        .reduce(|| (0.0, 0.0), merge)
        .1;
    println!("{x}");
}
