fn main() {
	mut s := ''
	for n in 1 .. 101 {
		if n % 3 == 0 {
			s += 'Fizz'
		}
		if n % 5 == 0 {
			s += 'Buzz'
		}
		if s.len == 0 {
			println(n)
		}
		else {
			println(s)
		}
		s = ''
	}
}
