PROJECT_DIR := digital_sundhed_3_ugers

build:
	@echo "Checking for CocoaPods..."
	@command -v pod >/dev/null 2>&1 || { \
		echo >&2 "CocoaPods not found. Install it first: sudo gem install cocoapods"; \
		exit 1; \
	}
	@echo "Running flutter pub get..."
	cd $(PROJECT_DIR) && flutter pub get
	@echo "Running pod install..."
	cd $(PROJECT_DIR)/ios && pod install
	@echo "Building iOS app..."
	cd $(PROJECT_DIR) && flutter build ios --no-codesign
	@echo "Build complete!"
