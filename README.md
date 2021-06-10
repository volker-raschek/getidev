# getidev

`getidev` is a small programme to determine the network interface for an IP
address.

`getidev` serves as an alternative to `ip route get <ip> | awk ...` because `ip
route get` can return different output depending on the environment and
therefore the construct is unsafe.
