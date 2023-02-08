docker build --pull --rm -f "Dockerfile" -t toga:latest "."
singularity build toga.sif docker-daemon://toga:latest
