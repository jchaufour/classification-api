FROM eu.gcr.io/fluid-door-230710/upstride:py-1.1.1-tf2.3.0-gpu

RUN apt-get update && \
    apt-get install -y libsm6 libxrender1 libxext6 libgl1-mesa-glx && \
    pip install \
    opencv-python \
    pyyaml \
    tensorflow_datasets \
    upstride_argparse \
    keras-tuner \
    pandas \
    tensorflow_addons && \
    rm -rf /var/lib/apt/lists/*

COPY src /opt/src
COPY submodules /opt/submodules
COPY train.py /opt/train.py
COPY train_arch_search.py /opt/train_arch_search.py
WORKDIR /opt
CMD python train.py
