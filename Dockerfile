FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
  python3 \
  python3-pip \
  git

# Create and activate a virtual environment 
RUN python3 -m venv /venv ENV PATH="/venv/bin:$PATH" 
# Install PyYAML inside the venv 
RUN pip install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]