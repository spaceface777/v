import term

const (
	w = 35
	h = 25
)

struct Game {
pub mut:
	cells [][]bool
}

fn (mut g Game) get(x, y int) bool {
	if y < 0 || x < 0 { return false }
	if y >= h || x >= w { return false }

	return g.cells[y][x]
}

fn (mut g Game) neighbours(x, y int) int {
	mut count := 0
	if g.get(x-1, y-1) { count++ }
	if g.get(x, y-1)   { count++ }
	if g.get(x+1, y-1) { count++ }
	if g.get(x-1, y)   { count++ }
	if g.get(x+1, y)   { count++ }
	if g.get(x-1, y+1) { count++ }
	if g.get(x, y+1)   { count++ }
	if g.get(x+1, y+1) { count++ }
	return count
}

fn (mut g Game) step() {
	term.clear()
	println(g)

	mut new_game := [][]bool{}
	for y, row in g.cells {
		mut new_row := []bool{}
		for x, cell in row {
			count := g.neighbours(x, y)
			new_row[x] = (cell && count in [2, 3]) || count == 3
		}
		new_game[y] = new_row
	}

	for new_game != g.cells {
		g.cells = new_game
		JS.setTimeout(fn() { g.step() }, 0)
	}
}

fn (mut g Game) str() string {
	mut str := ''
	for row in g.cells {
		for cell in row {
			str += if cell { '◼ ' } else { '◻ ' }
		}
		str += '\n'
	}
	return str
}

mut game := Game{
	cells: [][]bool{ len: h, init: []bool{ len: w } }
}

game.cells[6][15] = true
game.cells[6][16] = true
game.cells[7][16] = true
game.cells[5][21] = true
game.cells[7][20] = true
game.cells[7][21] = true
game.cells[7][22] = true

game.step()
