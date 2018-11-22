use std::io::prelude::*;
use std::fs::File;

fn main() -> std::io::Result<()> {

    println!("trying status checks for commits");

    let mut buffer = File::create("foo.txt")?;

    buffer.write(b"hello_world")?;
    Ok(())
}



