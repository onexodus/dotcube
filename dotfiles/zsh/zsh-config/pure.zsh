# if user is root, use red prompt
if [[ $UID -eq 0 ]]; then
  zstyle :prompt:pure:user color red
else
  zstyle :prompt:pure:user color cyan
fi

zstyle :prompt:pure:host color white
zstyle :prompt:pure:git:dirty color cyan
