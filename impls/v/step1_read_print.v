import readline
import reader

fn mal_read(str string) string {
	reader.tokenize(str)
	return str
}

fn mal_eval(ast string, env string) string {
	return ast
}

fn mal_print(exp string) string {
	return exp
}

fn mal_rep(str string) string {
	return mal_print(mal_eval(mal_read(str), ''))
}

fn main() {
	mut r := readline.Readline{}
	mut text := ''
	for {
		text = r.read_line('user> ') or { exit(0) }
		text = text.trim_right('\n')
		println(mal_rep(text))
	}
}