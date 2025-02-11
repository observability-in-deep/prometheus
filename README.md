# Observability in Deep - Prometheus

Este repositório contém exemplos e tutoriais sobre como utilizar o Prometheus para monitoramento e observabilidade de sistemas.

## Índice

- [Introdução](#introdução)
- [Instalação](#instalação)
- [Configuração de DNS](#configuração-de-dns)

## Introdução

Prometheus é uma ferramenta de monitoramento e alerta de código aberto, projetada para coletar métricas de sistemas e aplicações. Este repositório fornece recursos para ajudar você a começar com o Prometheus e a integrá-lo em seu ambiente.

## Instalação

Para instalar o Prometheus, siga os passos abaixo:

1. Execute o seguinte comando na sua maquina

```sh
chmod +x ./scrpts/*.sh
```

2. após isso basta executar o makefile

```sh
make install
```

## Configuração de DNS

- Para que os exemplos funcionem não se esqueça de mudar o seu arquivo de hosts colocando a seguinte linha:

```sh
ls /etc/hosts
127.0.0.1 obsevabilityindeep.local prometheus-server.local grafana.local

```