FROM python:latest
RUN pip3 install flask
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -P /scripts
	RUN chmod +x /scripts/wait-for-it.sh
	ENTRYPOINT ["/scripts/wait-for-it.sh", "db:5432", "--"]
EXPOSE 5000
 
ADD . .



CMD ["python", "app.py" ,"runserver",  "--host=0.0.0.0",  "--threaded"]