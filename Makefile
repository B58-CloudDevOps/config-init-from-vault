default:
	aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 355449129696.dkr.ecr.us-east-1.amazonaws.com
	docker build -t 355449129696.dkr.ecr.us-east-1.amazonaws.com/config-init-from-vault . 
	docker push 355449129696.dkr.ecr.us-east-1.amazonaws.com/config-init-from-vault