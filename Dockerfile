FROM python:3.9.15-bullseye

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

RUN python3 -m rasa train nlu --fixed-model-name "search_model"

CMD [ "python3", "-m" , "rasa", "run", "--enable-api","--cors", "*", "--debug", "--port", "5005","/app/models/search_model.tar.gz"]
