FROM arm64v8/ubuntu:18.04

RUN apt-get update && apt-get install -y \
  python3-pip python3-venv libjpeg-dev libfreetype6-dev pkg-config \
  libpng-dev wget

RUN wget -O torch-1.1.0a0+b457266-cp36-cp36m-linux_aarch64.whl https://nvidia.box.com/shared/static/veo87trfaawj5pfwuqvhl6mzc5b55fbj.whl
RUN mkdir images && \
  wget -O images/dog.jpg https://vetstreet-brightspot.s3.amazonaws.com/98/d98250a0d311e0a2380050568d634f/file/Golden-Retriever-3-645mk062411.jpg
RUN wget https://raw.githubusercontent.com/anishathalye/imagenet-simple-labels/master/imagenet-simple-labels.json

RUN pip3 install wheel
RUN pip3 install \
  jupyter numpy matplotlib pillow==5.4.1 \
  torch-1.1.0a0+b457266-cp36-cp36m-linux_aarch64.whl
RUN pip3 install --no-deps torchvision

CMD jupyter notebook --ip 0.0.0.0 --port 8888 --allow-root
