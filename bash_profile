# .bash_profile -*- mode: sh -*-

# Load login settings and environment variables
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi

# Load interactive settings
if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

# All files are inaccessible to "others" by default
# These permission bits are subtracted
umask 0027

if command -v neofetch 2>&1 >/dev/null; then
	neofetch
fi

