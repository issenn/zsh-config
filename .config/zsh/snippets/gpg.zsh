

endot()
{
  gpg -er "$1" "$2"
  # rm "$2"
}

dedot()
{
  gpg -do "${1%.gpg}" "$1"
  # rm "$1"
}
