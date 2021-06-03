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
