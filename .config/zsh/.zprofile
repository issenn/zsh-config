
# Default Java Home.
# [[ -z "$JAVA_VERSION" ]] && JAVA_VERSION=1.8
# [[ -s /usr/libexec/java_home ]] && export JAVA_HOME=$(/usr/libexec/java_home -v $JAVA_VERSION)

export NVM_DIR="${XDG_CONFIG_HOME}/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# PERL_MM_OPT="INSTALL_BASE=${XDG_CONFIG_HOME}/.perl5" cpan local::lib
# eval "$(perl -I${XDG_CONFIG_HOME}/.perl5/lib/perl5 -Mlocal::lib=${XDG_CONFIG_HOME}/.perl5)"

# eval "$(gh-md-toc --completion-script-zsh)"

# # export GOROOT="/usr/local/go"
# export GOROOT="/usr/local/opt/go/libexec"

# # export GOPATH="${HOME}/go"
# [[ -z "$GOPATH" ]] && export GOPATH="${HOME}/go"

# export PATH="${GOROOT}/bin:${GOPATH}/bin:$PATH"

# # Enable the go modules feature
# export GO111MODULE=on

# # Set the GOPROXY environment variable
# export GOPROXY=https://goproxy.io,direct
# # export GOPROXY=https://goproxy.cn,direct

# # export ANDROID_SDK_ROOT="${HOME}/Library/Android/sdk"
# export ANDROID_SDK_ROOT="/usr/local/share/android-sdk"

# export ANDROID_HOME="${ANDROID_SDK_ROOT}"

# # export PATH="${ANDROID_SDK_ROOT}/platform-tools:$PATH"

# export PATH="${ANDROID_SDK_ROOT}/tools:$PATH"

# export PATH="${ANDROID_SDK_ROOT}/tools/bin:$PATH"

# # export PATH="${ANDROID_SDK_ROOT}/build-tools/28.0.3:$PATH"


# export GROOVY_HOME="/usr/local/opt/groovy/libexec"
# # export GROOVY_HOME="/usr/local/opt/groovysdk/libexec"

# # export GRADLE_HOME=

# # export PATH="$GRADLE_HOME/.gradle/gradle-4.8.1/bin:$PATH"

# # Default is `"/(build|integTest|out)/"`
# export GRADLE_COMPLETION_EXCLUDE_PATTERN="/(build|integTest|samples|smokeTest|testFixtures|templates|out|features)/"
# # Essentially turn off checking for changed scripts
# export GRADLE_COMPLETION_EXCLUDE_PATTERN="gradle"

# export GRADLE_CACHE_TTL_MINUTES=$(expr 1440 \* 1)

# export GRADLE_COMPLETION_UNQUALIFIED_TASKS="true"


# # export PATH="/usr/local/opt/openresty/nginx/sbin:${PATH}"

# # export PATH="/usr/local/BaiduPCS-Go:${PATH}"
