FROM logstash:latest

#    && gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 \
#RUN curl -sSL https://get.rvm.io | bash -s stable --ruby=jruby

RUN gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
RUN curl -sSL https://get.rvm.io | bash -s stable --ruby=jruby
RUN ln -sf /usr/local/rvm/rubies/jruby-*/bin/jruby /usr/bin/jruby

RUN apt-get update \
    && apt-get install sudo \
    && /opt/logstash/bin/plugin update \
    && /opt/logstash/bin/plugin install logstash-patterns-core \
    && /opt/logstash/bin/plugin install logstash-output-elasticsearch \
    && /usr/bin/jruby -S gem install manticore -v '0.5.3'