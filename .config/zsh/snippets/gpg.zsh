

endot()
{
  gpg -er "$1" "$2"
  # rm "$2"
}

dedot()
{
  gpg -o "${1%.gpg}" -d "$1"
  # rm "$1"
}
