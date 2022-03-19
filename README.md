# zsh-config

校验 True-Color 的方法：

```sh
awk 'BEGIN{
    s="/\\/\\/\\/\\/\\"; s=s s s s s s s s;
    for (colnum = 0; colnum<77; colnum++) {
        r = 255-(colnum*255/76);
        g = (colnum*510/76);
        b = (colnum*255/76);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum+1,1);
    }
    printf "\n";
}'
```

```sh
curl -s https://gist.githubusercontent.com/lifepillar/09a44b8cf0f9397465614e622979107f/raw/24-bit-color.sh | bash
```

```sh
awk -v term_cols="${width:-$(tput cols || echo 80)}" 'BEGIN{
    s="/\\";
    for (colnum = 0; colnum<term_cols; colnum++) {
        r = 255-(colnum*255/term_cols);
        g = (colnum*510/term_cols);
        b = (colnum*255/term_cols);
        if (g>255) g = 510-g;
        printf "\033[48;2;%d;%d;%dm", r,g,b;
        printf "\033[38;2;%d;%d;%dm", 255-r,255-g,255-b;
        printf "%s\033[0m", substr(s,colnum%2+1,1);
    }
    printf "\n";
}'
```

> [Print true color (24-bit) test pattern](https://unix.stackexchange.com/questions/404414/)

校验 256-Color 的方法：

```sh
curl -s https://gist.githubusercontent.com/HaleTom/89ffe32783f89f403bba96bd7bcd1263/raw/ | bash
```

```sh
for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
        printf "\n";
    fi
done

for i in {0..255} ; do
    printf "\x1b[38;5;${i}m%3d " "${i}"
    if (( $i == 15 )) || (( $i > 15 )) && (( ($i-15) % 12 == 0 )); then
        echo;
    fi
done
```

```sh
https://github.com/trapd00r/rgbterm
https://github.com/trapd00r/colorcoke
```

```sh
curl -s https://raw.githubusercontent.com/eikenb/terminal-colors/master/terminal-colors | python
```

```sh
curl -s https://gist.githubusercontent.com/justinabrahms/1047767/raw/colortest.py | python2
```

```sh
curl -s https://raw.githubusercontent.com/grawity/code/master/term/xterm-color-chooser | python
```

```sh
curl -s -L https://git.gnome.org/browse/vte/plain/perf/256test.sh?h=vte-0-38 | bash
curl -s -L https://git.gnome.org/browse/vte/plain/perf/256test.sh | bash
```

```sh
curl -s https://gist.githubusercontent.com/WoLpH/8b6f697ecc06318004728b8c0127d9b3/raw/colortest.py | python3
```

```sh
curl -s https://gist.githubusercontent.com/hSATAC/1095100/raw/256color.pl | perl
```

```sh
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/gawin/bash-colors-256/master/colors)"
```

```sh
curl -s https://raw.githubusercontent.com/scottchiefbaker/perl-git-prompt/master/utils/term-colors.pl | perl
```

```sh
# A one-liner

# background color
for i in {0..255}; do printf '\e[48;5;%dm%3d ' $i $i; (((i+3) % 18)) || printf '\e[0m\n'; done

# foreground color
for i in {0..255}; do printf '\e[38;5;%dm%3d ' $i $i; (((i+3) % 18)) || printf '\e[0m\n'; done
```

> [Print a 256-color test pattern in the terminal](https://askubuntu.com/questions/821157/)
> [Print a 256-color test pattern in the terminal [closed]](https://unix.stackexchange.com/questions/308094/)
> [Terminal 256 colors scripts](https://blog.yjl.im/2013/02/terminal-256-colors-scripts.html)

## Usage

### plenv


#### cpan

```sh
cpan local::lib
```

#### [cpanm](http://cpanmin.us/)

"system" perl has correctly configured httpS support, but if you've switched to another plenv version, you'll need to install https support for that version:

```sh
plenv install-cpanm
cpanm Mozilla::CA
cpanm LWP
cpanm LWP::Protocol::https
```

> [tokuhirom/plenv #163 no backend configured for scheme https #163](https://github.com/tokuhirom/plenv/issues/163)
