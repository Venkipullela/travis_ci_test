use std::io::prelude::*;
use std::fs::File;
extern crate regex;
use regex::Regex;

fn main() -> std::io::Result<()> {

    println!("it will trigger from github side and should show the status as well");

    let mut a = 5;
    while a != 0 {
        a = a-1;
        println!("{}",a);
    };





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



