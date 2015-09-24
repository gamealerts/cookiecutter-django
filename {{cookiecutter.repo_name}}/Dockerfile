{% if cookiecutter.use_python2 == 'n' -%}
FROM python:3.5
{% else %}
FROM python:2.7
{%- endif %}
ENV PYTHONUNBUFFERED 1

# Requirements have to be pulled and installed here, otherwise caching won't work
ADD ./requirements /requirements
ADD ./requirements.txt /requirements.txt

RUN pip install -r /requirements.txt
RUN pip install -r /requirements/local.txt

ADD . /app

WORKDIR /app

ENTRYPOINT ["/entrypoint.sh"]
