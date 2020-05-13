lint:
	#chmod +x ./scripts/python_lint.sh
	sh ./scripts/python_lint.sh

build:
	sh ./scripts/build_run_image.sh

upload:
	sh ./scripts/upload_image.sh