# VSLAM Comparison

This comparison is part of a localization robotic course at the Universidade Federal da Bahia (UFBA) master's degree program. The comparison here is intended to minimally mimic the excellent work made by Alexey Merzlyakov and Steve Macenski, who wrote the paper [A Comparison of Modern General-Purpose Visual SLAM Approaches]. It is worth highlighting that this work is not intended to replace the work made by these authors.

[A Comparison of Modern General-Purpose Visual SLAM Approaches]: https://ieeexplore.ieee.org/document/9636615

## Usage

First of all, clone this repository into your machine

```console
git clone https://github.com/mateusmenezes95/vslam_comparison.git
``` 

As you see, it was created a [Dockerfile](/docker/Dockerfile) and bash scripts to ease the replication of the comparison through a simulation using ROS Noetic and Gazebo 11. To setup the docker container, follow the next instructions.

Go into the folder [`docker`](/docker/) containing bash scripts and the Dockerfile

```console
cd docker/
```

Now run, which will build a docker image of ROS Noetic

```console
./build_image.sh
```

After the build phase, just run the container

```console
./run-container.sh
```

To see if is everything ok, in the terminal launched, run

```console
roscore
```

Execute the `./run-container.sh` in a **new** terminal to launch a **new** terminal inside the same container launched a priori. Then, run the `listener` node. Nothing will happen until you launch the `talker` node

```console
rosrun roscpp_tutorials listener
```

To launch the `talker` node, again in a new terminal repeating the execution of `./run-container.sh`, run

```console
rosrun roscpp_tutorials talker
```

You must see something like

- From the `talker` node:

```console
mateus_docker@dell:~$ rosrun roscpp_tutorials talker 
[ INFO] [1664851703.004928103]: hello world 0
[ INFO] [1664851703.105062777]: hello world 1
[ INFO] [1664851703.205134225]: hello world 2
[ INFO] [1664851703.305133228]: hello world 3
[ INFO] [1664851703.405134370]: hello world 4
[ INFO] [1664851703.505133031]: hello world 5
[ INFO] [1664851703.605162346]: hello world 6
[ INFO] [1664851703.705122720]: hello world 7
[ INFO] [1664851703.805129064]: hello world 8
[ INFO] [1664851703.905136324]: hello world 9
[ INFO] [1664851704.005136090]: hello world 10
...
```

- From the `listener` node:

```console
mateus_docker@dell:~$ rosrun roscpp_tutorials listener
[ INFO] [1664851703.305901909]: I heard: [hello world 3]
[ INFO] [1664851703.405803441]: I heard: [hello world 4]
[ INFO] [1664851703.505634738]: I heard: [hello world 5]
[ INFO] [1664851703.605727613]: I heard: [hello world 6]
[ INFO] [1664851703.705598423]: I heard: [hello world 7]
[ INFO] [1664851703.805713104]: I heard: [hello world 8]
[ INFO] [1664851703.905704093]: I heard: [hello world 9]
[ INFO] [1664851704.005709959]: I heard: [hello world 10]
...
```

To kill the nodes press `ctrl+c` to the `talker`, `listener`, and `roscore` terminals.
