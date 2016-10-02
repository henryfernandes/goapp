provider "docker" {
  host = "tcp://127.0.0.1:2375/"
}

resource "docker_image" "gobuild" {
  name = "gobuild"
}
resource "docker_image" "godeploy" {
  name = "godeploy"
}
resource "docker_image" "nginx" {
  name = "gonginx"
}

resource "docker_container" "node1" {
  name = "node1"
  hostname = "node1"
  image = "${docker_image.godeploy.latest}"
  ports {
    internal = 8484
  }
  volumes {
    container_path  = "/go/bin/helloapp"
    host_path = "/opt/gitrepo/goapp/deploy/helloapp"
    read_only = true
  }
}

resource "docker_container" "node2" {
  name = "node2"
  hostname = "node2"
  image = "${docker_image.godeploy.latest}"
  ports {
    internal = 8484
  }
  volumes {
    container_path  = "/go/bin/helloapp"
    host_path = "/opt/gitrepo/goapp/deploy/helloapp"
    read_only = true
  }
}

resource "docker_container" "nginx-server" {
  name = "nginx-server"
  image = "${docker_image.nginx.latest}"
  must_run = true
  ports {
    internal = 80
  }
  links =  ["node1:node1"]
  links =  ["node2:node2"]
}
