# system-log-management

# Global log metadata

Labels that all logs should have. Contain relevant metadata.

Set by the forwarder:

- log_cluster: id of the cluster where the log is produced
- log_hostname: id of the machine where the log is produced
- log_machinerole: role of the machine where the log is produced
- log_source: kind or type of log (kube, systemd, audit...)

Legacy labels:

- origin: should be the same as log_cluster, but this one is inferred by the aggregator instead of set by the forwarder

# Do we need to set this label at the forwarder now as we're getting rid of the fluentd aggregator?
