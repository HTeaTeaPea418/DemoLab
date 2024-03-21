FROM hashicorp/terraform:light

# https://github.com/xpn/DemoLab/blob/master/.gitlab-ci.yml#L19
RUN apk add --update python3 python3-dev py3-pip jq gcc g++ make 

# https://github.com/xpn/DemoLab/blob/master/.gitlab-ci.yml#L56
RUN apk add --update ruby ruby-dev ruby-bundler ruby-webrick ruby-etc linux-headers

# https://github.com/xpn/DemoLab/blob/master/.gitlab-ci.yml#L20
RUN pip install awscli

# https://github.com/xpn/DemoLab/blob/master/.gitlab-ci.yml#L4
ENTRYPOINT /usr/bin/env PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin