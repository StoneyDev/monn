loc:
	puro dart run easy_localization:generate --source-dir "assets/translations" && puro dart run easy_localization:generate -f keys -o locale_keys.g.dart --source-dir "assets/translations"

splash:
	puro dart run flutter_native_splash:create

build-runner:
	puro dart run build_runner build -d

prod:
	puro flutter build apk --dart-define-from-file=api_keys.json