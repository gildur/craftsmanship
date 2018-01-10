eval $(aws ecr get-login --region us-east-2 | sed 's/-e none//') #needs AWS_ACCESS_KEY_ID and AWS_SECRET_ACCESS_KEY envvars
./gradlew pushImage
ecs-cli configure --cluster 1mindemo --region us-east-2
ecs-cli compose --file docker/craftsmanship-compose.yml service down
sleep 15
ecs-cli compose --file docker/craftsmanship-compose.yml service up
