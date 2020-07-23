struct Color {
        r int
        g int
        b int
}

pub fn (c Color) str() string {
	return '{$c.r, $c.g, $c.b}'
}

fn rgb(r, g, b int) Color {
	return Color{r: r, g: g, b: b}
}

const (
        nums = [1, 2, 3]
        red  = Color{r: 255, g: 0, b: 0}
        blue = rgb(0, 0, 255)
)

fn main() {
        println(nums)
        println(red)
        println(blue)
}
