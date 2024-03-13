FROM ubuntu:latest

# Set environment variables to non-interactive
ENV DEBIAN_FRONTEND=non-interactive

# Update package list and install essential packages
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    llvm-11 llvm-11-dev \
    clang \
    cmake \
    git \
    wget \
    unzip \
    pkg-config \
    nasm \
    qtbase5-dev \
    qtchooser \
    qt5-qmake \
    libqt5widgets5 \
    qtcreator \
    libx11-xcb1 \
    libxcb-icccm4 \
    libxcb-image0 \
    libxcb-keysyms1 \
    libxcb-randr0 \
    libxcb-render-util0 \
    libxcb-xinerama0 \
    libxkbcommon-x11-0 \
    libglu1-mesa-dev \
    libxrender1 \
    libfontconfig1 \
    libxext6 \
    curl

# Clean up to reduce image size
RUN   apt-get autoremove -y && \
      apt-get clean && \
      rm -rf /var/lib/apt/lists/*


# Install google-test
RUN wget -O google-test.zip https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip && \
    unzip google-test.zip && \
    cd googletest-* && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    cd ../../ && \
    rm -rf google-test.zip googletest-*

# Reset environment variable
ENV DEBIAN_FRONTEND=

# Set the working directory
WORKDIR /workspace

# Set the default command
CMD ["bash"]
# CMD ["qtcreator"]