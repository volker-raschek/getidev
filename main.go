package main

import (
	"fmt"
	"log"
	"net"
	"os"
	"strings"
)

func main() {
	ips := os.Args[1:]
	switch {
	case len(ips) == 0:
		log.Fatal("Expect at least one argument")
	case len(ips) >= 2:
		log.Fatal("Expect only one argument")
	}

	ip := strings.Split(ips[0], "/")[0]

	interfaces, err := net.Interfaces()
	if err != nil {
		log.Fatal(err.Error())
	}

	for _, iface := range interfaces {
		addrs, err := iface.Addrs()
		if err != nil {
			log.Fatal(err.Error())
		}

		for _, addr := range addrs {
			if strings.Split(addr.String(), "/")[0] == ip {
				_, err = fmt.Fprintln(os.Stdout, iface.Name)
				if err != nil {
					log.Fatal(err.Error())
				}
				return
			}
		}
	}

	os.Exit(1)
}
