
struct Foo { val int }

type Number = int | f64 | Foo | string

fn is_gt(val string, dst Number) bool {
	match dst {
		int   { return val.int() > dst }
		f64 { return val.f64() > dst }
		Foo       { return val.int() > dst.val }
		string    { return val.int() > dst.int() }
	}
}

fn main() {
	rs := is_gt('3', int(4))
	println(rs)
}
