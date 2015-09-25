{% if cookiecutter.use_python2 == 'n' -%}
FROM python:3.5
{% else %}
FROM python:2.7
{%- endif %}

# Install OpenSSH
RUN apt-get update && \
    apt-get -y install openssh-server

RUN rm -rf /var/lib/apt/lists/*

# sshd needs this directory to run
RUN mkdir -p /var/run/sshd

# Copy configuration and entrypoint script
COPY sshd_config /etc/ssh/sshd_config

COPY /keys_to_docker/host_key /etc/ssh/ssh_host_rsa_key
COPY /keys_to_docker/host_key.pub /etc/ssh/ssh_host_rsa_key.pub

RUN chmod 600 /etc/ssh/ssh_host_rsa_key
RUN chmod 644 /etc/ssh/ssh_host_rsa_key.pub

ADD entrypoint.sh /entrypoint_debug.sh

# rename django username to django
RUN groupadd -r django && useradd -r -g django django

RUN mkdir -p /home/django/.ssh
ADD /keys_to_docker/id_rsa.pub /home/django/.ssh/authorized_keys

RUN chmod 700 /home/django/.ssh
RUN chmod 600 /home/django/.ssh/authorized_keys
RUN chmod 755 /home/django

RUN chown -R django:django /home/django

RUN echo "django:docker" | chpasswd

EXPOSE 22
EXPOSE 8000

ENTRYPOINT ["/entrypoint_debug.sh"]
