job "web"{
    datacenters = ["dc1"]

    group "web"{

        network {
           port "http"{
                static = 4000
           }
        }

        task "web"{
            driver = "docker"

            config {
                    image = "fluxappacr.azurecr.io/web:latest"
                    ports = ["http"]
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