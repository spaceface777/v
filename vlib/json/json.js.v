module json

pub fn decode(typ any, s string) ?any {
	// compiler implementation
	return 0
}

pub fn encode(x any) string {
	return JS.JSON.stringify(x)
}
