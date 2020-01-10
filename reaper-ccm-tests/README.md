# TLP Reaper CCM action

This action runs Reaper's ITs using CCM.

## Inputs

### `cassandra-version`

**Required** Which Cassandra version to test against. Default `3.11.5`.

## Outputs

There are no outputs.

## Example usage

uses: actions/hello-world-docker-action@v1
with:
  cassandra-version: 3.11.5
