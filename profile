export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR=vim

export PROMPT='%m %~> '
export RPROMPT='%T'

export JAVA_HOME=$(readlink -f /usr/bin/javac | sed "s:/bin/javac::")

export MAVEN_OPTS="-Xmx512m -XX:MaxPermSize=350m"

export PARINIT='rTbgqR B=.,?_A_a Q=_s>|'

export PATH="~/local/bin:/usr/local/bin:$PATH"

if [[ -e /usr/lib/git-core/git-sh-prompt ]]; then
    source /etc/bash_completion.d/git-prompt
    export PS1='[\u@\h \w$(__git_ps1 " (%s)")]\$ '
fi

export NO_PROXY=/var/run/docker.sock

if [[ -e ~/.profile.private ]]; then
   source ~/.profile.private
fi

source ~/.alias
