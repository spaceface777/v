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

fn make_gettable<T>(x Gettable<T>) Gettable<T> {
	return x
}

fn main() {
	a := Animal<int>{ 123 }
	b := Animal<int>{ 456 }

	ga := make_gettable<int>(a)
	gb := make_gettable<int>(b)

	arr := [ga, gb]
	// arr := [Gettable<int>(a), Gettable<int>(b)]
	dump(typeof(arr).name)
	x := extract(arr)
	println(x)
}
