sudo ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
XAUTHORITY=$HOME/.Xauthority
export XAUTHORITY
LANG=zh_CN.UTF-8
echo $$ > /tmp/xsession.pid
export LANG
export LC_CTYPE=zh_CN.UTF-8
export XMODIFIERS=@im=SCIM
export GTK_IM_MODULE=scim
export QT_IM_MODULE=scim
scim -d
autocutsel -fork
. $HOME/.xsession
