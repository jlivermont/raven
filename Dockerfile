FROM jlivermont/raven-base:${CIRCLE_BUILD_NUM}

ARG VCS_REF

LABEL org.label-schema.vcs-ref=$VCS_REF
LABEL org.label-schema.vcs-url="https://github.com/jlivermont/raven"

USER root
COPY . /app/
RUN chown -R ruby /app

USER ruby
CMD ["/app/bin/rails", "s", "-b", "0.0.0.0", "-p", "3000"]
