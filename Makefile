build-docker:
	docker compose -f docker-compose.yml up -d
	docker ps -a
	docker images

run-train-docker:
	docker exec cicd-docker-ml-demo-azure-core-1 python train.py

eval:
	echo "## Model Metrics" > report.md
	cat ./Results/metrics.txt >> report.md
	echo '\n## Confusion Matrix Plot' >> report.md
	echo '![Confusion Matrix](./Results/model_results.png)' >> report.md
	cml comment create report.md

stop-docker:
	docker compose -f docker-compose.yml down
