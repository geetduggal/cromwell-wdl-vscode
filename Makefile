dependencies: cromwell-32.jar dxWDL-0.66.2.jar docker-dependencies # dx-toolkit

docker-dependences:
	bash testimg/dependencies.sh

cromwell-32.jar:
	wget https://github.com/broadinstitute/cromwell/releases/download/32/cromwell-32.jar

dxWDL-0.66.2.jar:
	wget https://github.com/dnanexus/dxWDL/releases/download/0.66.2/dxWDL-0.66.2.jar

test: unit-tests integration-tests

unit-tests: docker-images
	docker run geetduggal/testimg:0.1 python unit_tests.py

docker-images:
	docker build -t geetduggal/testimg:0.1 testimg
	docker push geetduggal/testimg:0.1

integration-tests: docker-images cromwell-32.jar 
	java -jar cromwell-32.jar run integration_tests.wdl -i inputs.json

dnanexus: dxWDL-0.66.2.jar
	echo "Make sure you are logged into a DNAnexus project"
	dx whoami
	java -jar dxWDL-0.66.2.jar compile integration_tests.wdl

# integration-tests-dnanexus: larger integration tests in the cloud

# release: tag Github release and Docker images, publish versioned workflow

	
