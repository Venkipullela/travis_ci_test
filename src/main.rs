use std::io::prelude::*;
use std::fs::File;

fn main() -> std::io::Result<()> {

    println!("ento ee build");

    let mut buffer = File::create("foo.txt")?;

    buffer.write(b"hello_world")?;
    Ok(())
}



