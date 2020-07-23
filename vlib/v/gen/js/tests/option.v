struct User {
	id   int
	name string
}

struct Repo {
	users []User
}

fn new_repo() Repo {
	return Repo {
		users: [User{1, 'Andrew'}, User {2, 'Bob'}, User {10, 'Charles'}]
	}
}

fn (r Repo) find_user_by_id(id int) ?User {
	for user in r.users {
		if user.id == id {
			// V automatically wraps this into an option type
			return user
		}
	}
	return error('User $id not found')
}

fn foo_opt() ?string {
	return '123'
}

fn foo() {
	a := foo_opt() or { 'str' }
	println(a)
}

fn main() {
	foo()
	repo := new_repo()
	// Option types must be handled by `or` blocks
	u1 := repo.find_user_by_id(100) or {
		// `or` block must end with `return`, `break`, or `continue`
		println('Error: $err')
		return
	}
	println(u1)
}
