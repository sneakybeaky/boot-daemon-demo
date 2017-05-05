# Concourse CI 

## The debian package pipeline

To install do

    fly -t ci set-pipeline -c ci/pipelines/deb_release.yml --pipeline boot-daemon-package \
        -v s3-access-key-id=........ \
        -v s3-secret-access-key=....... 
	
## The AMI pipeline
	
To install do

    fly -t ci set-pipeline -c ci/pipelines/deb_ami.yml --pipeline boot-daemon-ami \
	    -v aws_access_key_id=.... \
	    -v aws_secret_access_key=....... \    
        -v s3-access-key-id=........ \
        -v s3-secret-access-key=.......	