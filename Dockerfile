FROM python:3
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
EXPOSE 5000
COPY . .
RUN pip install flask 
RUN python3 test.py
CMD ["flask", "run"]
