build-docker:
	docker compose -f docker-compose.yml up -d
	docker ps -a
	docker image

run-train-docker:
	docker exec cicd_docker_ml_demo-core-1 python train.py

stop-docker:
	docker compose -f docker-compose.yml down

install:
	pip install --upgrade pip && pip install -r requirements.txt

format:
	black *.py

train:
	python train.py

eval:
	echo "## Model Metrics" > report.md
	cat ./Results/metrics.txt >> report.md
	echo '\n## Confusion Matrix Plot' >> report.md
	echo '![Confusion Matrix](./Results/model_results.png)' >> report.md
	cml comment create report.md
