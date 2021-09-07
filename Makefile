build:
	# Add step to generate release files eventually? 
	docker build -f docker/Dockerfile -t pond-server:latest .

tag:
	@docker tag \
		pond-server:latest \
		820778634712.dkr.ecr.us-west-1.amazonaws.com/pond-server:latest

push:
	docker push 820778634712.dkr.ecr.us-west-1.amazonaws.com/pond-server:latest

aws-login:
	@aws \
		--profile=personal \
		ecr get-login-password \
		--region us-west-1 | \
		docker login \
		--username AWS \
		--password-stdin 820778634712.dkr.ecr.us-west-1.amazonaws.com

run:
	@docker run \
		-e POND_SERVER_PORT=3000 \
		-p 3000:3000/tcp \
		-p 3000:3000/udp \
		-it pond-server:latest

release: build tag aws-login push
