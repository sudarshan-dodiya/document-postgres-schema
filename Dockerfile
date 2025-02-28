FROM nikolaik/python-nodejs:python3.10-nodejs14

COPY entrypoint.sh /entrypoint.sh
COPY requirements.txt /requirements.txt
COPY generate_db_schema_documentation.py /generate_db_schema_documentation.py
COPY package.json /package.json
COPY package-lock.json /package-lock.json

# NPM needs this
ENV CI=true

RUN chmod +x /entrypoint.sh && \
    chmod +x /generate_db_schema_documentation.py && \
    pip3 install -r requirements.txt && \
    npm install

ENTRYPOINT ["/entrypoint.sh"]
