# Testing out VS Code with WDL, Docker, and Cromwell

This is an exepriment to see how seamlessly local development of a workflow in VS Code with debugging, unit testing etc can migrated to the DNAnexus cloud.

## Setup

The idea here is that code is edited and tested locally.  Ideally all unit tests are run in the Docker image, however the work to make the unit tests integrations in VS code run as if they are in a Docker image will be useful.  Right now the dependencies are coded in `testimg/dependencies.sh`.

My goal is to see how to make this process more seemless.

Here's what you currently do:

```bash

make dependencies # Installs dependencies necessary for local execution of tests, etc

make test  # Runs unit and integration tests
           # Unit tests using unittest
           # Integration tests use WDL

make dnanexus # Compiles main workflow and integration test workflow to DNAnexus for testing on larger files at scale
```

## Handy links

* Handy to see Python unit tests: https://code.visualstudio.com/docs/python/unit-testing
* Useful for step-through debugging via bind mounting: https://github.com/broadinstitute/cromwell/issues/2190
