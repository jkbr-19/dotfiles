prompt_halflife_setup () {
	cat <<'EOF'
Hier steht nichts hilfreiches
EOF
}

prompt_halflife_setup () {
	PS1='%B%F{yellow}%n%F{blue}@%F{magenta}%m%F{166} λ %f%b'
	RPS1="%F{cyan}%~%f"

}

prompt_halflife_setup "$@"
