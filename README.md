# K8sPlaypen
This repository provides developers with an easy-to-deploy Kubernetes environment that includes commonly used applications. By doing so, developers can avoid the complexity and time-consuming effort of setting up their own development environment.

+ **Important:** 

    Please note that this development environment should never be used for production purposes, as it intentionally prioritizes ease of use over security. Additionally, we advise against enabling all of the add-ons if your machine cannot handle them, as this could potentially cause damage to your system or hardware.

## Prerequisites
- The project has only been tested on Ubuntu (20.04), but we are currently working on ensuring compatibility with MacOS.
- Deployment is done using Ansible therefore Python is required. 
- The necessary binaries will be downloaded automatically to the `bin/` directory, so no further action is required.

## How to use
1. Run `./deploy.sh` to spin up a Kind cluster and deploy everything.
2. Be patient and give the different components time to become fully deployed
3. To access the homepage, go to https://localtest.me.

## Ingress

Several ingresses are available and can be configured under `config.yaml`.

- Traefik: https://doc.traefik.io/
- HAProxy Kubernetes Ingress: https://haproxy-ingress.github.io/docs/
- Nginx: https://www.nginx.com/

## Add-ons
Similar to ingress, add-ons can be enabled under `config.yaml`.

- **[Adminer](https://github.com/vrana/adminer)**

    A user interface to manage databases.
- **[Cerebro](https://github.com/lmenezes/cerebro)**
   
    A user interface to manage Elasticsearch.
- **[Crane](https://github.com/Docker-Solomon/crane)** 
 
    A user interface for the Docker registry.
- **[Docker Registry](https://github.com/distribution/distribution)**
   
    A private container registry for secure storage and distribution of Docker images.

    example usage:
    ```bash
    docker build -t registry.localtest.me/myapp .
    docker push registry.localtest.me/myapp
    
    cat  <<EOF | kubectl apply -f -
    apiVersion: apps/v1
    kind: Deployment
    metadata:
    name: myapp
    labels:
        app: myapp
    spec:
    selector:
        matchLabels:
        app: myapp
    template:
        metadata:
        labels:
            app: myapp
        spec:
        containers:
        - name: myapp
            image: registry.localtest.me/myapp
            ports:
            - containerPort: 80

    ```
- **[Elasticsearch](https://github.com/elastic/elasticsearch)**
   
    A distributed, open-source search and analytics engine for all types of data.
- **[Helm Cabin](https://github.com/balloonio/helm-cabin)**
   
    A user interface for deployed Helm charts.
- **[Kube-Prometheus-Stack](https://github.com/prometheus-operator/kube-prometheus)**
   
    A complete Kubernetes-native Prometheus and Grafana monitoring stack.
- **[Kubernetes Dashboard](https://github.com/kubernetes/dashboard)**
   
    A web-based user interface for managing Kubernetes clusters.
- **[Loki](https://github.com/grafana/loki)**
   
    A horizontally-scalable, highly-available, multi-tenant log aggregation system designed for modern microservices architectures.
- **[MariaDB](https://github.com/MariaDB/server)**
   
    A MySQL-compatible relational database management system.
- **[Minio](https://github.com/minio/minio)**
   
    A high-performance, S3-compatible object storage service that can store unstructured data such as photos, videos, and log files.
    example usage:
    ```bash
    mc alias set test  https://minio-svc.localtest.me minio minioadmin
    mc ls test/

    ```
- **[Redis](https://github.com/redis/redis)**
   
    An in-memory data structure store used as a distributed cache, database, and message broker.
- **[RedisInsight](https://github.com/redislabs/redisinsight)**
   
    A graphical user interface for Redis.



