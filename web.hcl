job "web"{
    datacenters = ["dc1"]

    group "web"{

        network {
            port "http" {
                static = 8080
                to     = 80
            }
        }

        task "web"{
            driver = "docker"

            config {
                    image = "fluxappacr.azurecr.io/web:latest"
                    ports = ["http"]s
                    auth {
                        username = "<username>"
                        password = "<password>"
                    }
             }
        }

        service {
            name = "web"
            port = "http"

            tags = [
                "web",
                "html",
            ]

            check {
                type     = "http"
                path     = "/"
                interval = "10s"
                timeout  = "3s"
            }
        }
    }
}