# Using Jetson Nano with Docker

This follows along with [this guide](https://medium.com/@heldenkombinat/image-recognition-with-pytorch-on-the-jetson-nano-fd858a5686aa). It does some basic computer vision in a Jupyter notebook.

Build the Docker image. This will take a bit.
```
docker build -t jetson-nano-docker .
```

```
docker run -it -p 8888:8888 \
  --device=/dev/nvhost-ctrl \
  --device=/dev/nvhost-ctrl-gpu \
  --device=/dev/nvhost-prof-gpu \
  --device=/dev/nvmap \
  --device=/dev/nvhost-gpu \
  --device=/dev/nvhost-as-gpu \
  -v /usr/local/cuda/lib64:/usr/local/cuda/lib64 \
  -v /etc/alternatives:/etc/alternatives \
  -v /usr/lib/aarch64-linux-gnu:/usr/lib/aarch64-linux-gnu \
  -e LD_LIBRARY_PATH=/usr/local/cuda/lib64:/usr/lib/aarch64-linux-gnu:/usr/lib/aarch64-linux-gnu/tegra \
  jetson-nano-docker
```

In a Jupyter notebook run the [code from the tutorial](https://gist.githubusercontent.com/jorgedch/f4c242dcd96b86ec364aca9e3f1f3fa7/raw/3949897e2b86071f35bd5f4c438158eb855fee63/Inference_PyTorch.py).
