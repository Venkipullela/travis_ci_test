use std::io::prelude::*;
use std::fs::File;
extern crate regex;
use regex::Regex;
use std::process::{Command, Stdio};
use std::process::{Command as cmd, Output};
use std::thread;
use std::time::Duration;
use std::io::{self, Read, BufReader};

fn main() -> std::io::Result<()> {

    println!("it will trigger from github side and should show the status as well");

    let mut a = 5;
    while a != 0 {
        a = a-1;
        println!("{}",a);
    };

    let mut cmd = Command::new("/Users/venkatesh/rust_practice/date/1.sh")
        .arg("Hello, world!")
        .stdout(Stdio::piped())
        .spawn()
        .unwrap();

    let mut buffered_stderr = BufReader::new(cmd.stdout.take().unwrap());
    //let status = cmd.wait();
    println!("it waited 15 secs here");

    let mut buffer = String::new();

    let stdout = io::stdout();
    let mut handle = stdout.lock();

    while buffered_stderr.read_line(&mut buffer).unwrap() > 0 {
        // grab our copy of the output, clear the original buffer,
        // and then write the bytes to stderr
        let b = buffer.to_owned();
        //buffer.clear();
        let some = handle.write(b.as_bytes());

        //println!("printing this {:?}",some);
    }



//    let a = String::from("venki12321");
//    println!("{}",a.replace("ven", "hey"));
//
//    let re = Regex::new(r"[d-i]").unwrap();
//    let result = re.replace_all("id: 3", "0");
//    println!("{}", result);
//
//    let mut buffer = File::create("foo.txt")?;
//
//    buffer.write(b"hello_world")?;
    Ok(())

}




//use std::error::Error;
//use std::io::prelude::*;
//use std::process::{Command, Stdio};
//
//static PANGRAM: &'static str =
//    "the quick brown fox jumped over the lazy djjf dogn \n
//     jwj ejd jsie";
//
//fn main() {
//    // Spawn the `wc` command
//    let process = match Command::new("wc")
//        .stdin(Stdio::piped())
//        .stdout(Stdio::piped())
//        .spawn() {
//        Err(why) => panic!("couldn't spawn wc: {}", why.description()),
//        Ok(process) => process,
//    };
//
//    // Write a string to the `stdin` of `wc`.
//    //
//    // `stdin` has type `Option<ChildStdin>`, but since we know this instance
//    // must have one, we can directly `unwrap` it.
//    match process.stdin.unwrap().write_all(PANGRAM.as_bytes()) {
//        Err(why) => panic!("couldn't write to wc stdin: {}",
//                           why.description()),
//        Ok(_) => println!("sent pangram to wc"),
//    }
//
//    // Because `stdin` does not live after the above calls, it is `drop`ed,
//    // and the pipe is closed.
//    //
//    // This is very important, otherwise `wc` wouldn't start processing the
//    // input we just sent.
//
//    // The `stdout` field also has type `Option<ChildStdout>` so must be unwrapped.
//    let mut s = String::new();
//    match process.stdout.unwrap().read_to_string(&mut s) {
//        Err(why) => panic!("couldn't read wc stdout: {}",
//                           why.description()),
//        Ok(_) => print!("wc responded with:\n{}", s),
//    }
//}
//
