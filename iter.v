// struct None {}
// type WeirdOption<T> = T | None

// fn unwrap<T>(o WeirdOption<T>) T {
// 	if o is T {
// 		return o
// 	}
// 	eprintln('got None')
// 	return T{}
// }

// fn main() {
// 	x := WeirdOption<int>(None{})
// 	y := WeirdOption<bool>(true)
// 	println('$x, $y')

// 	ux := unwrap(x)
// 	uy := unwrap<bool>(y)
// 	println('$ux, $uy')
// }


interface Gettable<T> {
  get() T
}

struct Animal<T> {
  metadata T
}

fn (a Animal<T>) get<T>() T {
  return a.metadata
}

fn extract<T>(xs []Gettable<T>) []T {
  return xs.map(it.get())
}

fn extract_basic<T>(xs Gettable<T>) T {
  return xs.get()
}


fn main() {
	a := Animal<int>{ 123 }
	b := Animal<int>{ 456 }

	// arr := [Gettable<int>(a), Gettable<int>(b)]
	// dump(typeof(arr).name)
	// x := extract<int>(arr)
	// println(x)

	aa := extract_basic(a)
	bb := extract_basic(b)
	println('$aa | $bb')
}
