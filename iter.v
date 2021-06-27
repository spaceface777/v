struct TestIterator {
mut:
	val int
}

fn (t TestIterator) has_next() bool {
	return t.val < 10
}

fn (mut t TestIterator) next() int {
	t.val++
	return t.val
}

//////////////////////////////////////

interface Iterator<T> {
	has_next() bool
	next() T
}

fn (i Iterator<T>) print<T>() {
	for i.has_next() {
		println('-> ${i.next()}')
	}
}

//////////////////////////////////////

fn make_iter<T>(i Iterator<T>) Iterator<T> {
	return i
}

fn main() {
	println('----------------------------------\n\n\n')
	i := make_iter(TestIterator{})
	println(i)
	println(typeof(i).name) // Iterator<int>
	i.print() // inference from the receiver
}
