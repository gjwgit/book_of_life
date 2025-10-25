# Create an App

## lib/

The `lib/` directory contains the dart source code.

### main.dart

The `main.dart` is the expected main entry point to the app. Its task
in our framework is to initialise the appliocation and then launch the
app itself.

### app.dart

The `App()` is typically where we instantiate a SolidLogin,
providing the login page for the app. After logging in the AppScaffold
is instantiated.

### app_scaffold.dart

The `AppScaffold()` builds a `SolidScafold()` to set up the framework
for a typical Solid app. The child is the `Home()` widget.

### home.dart

The `Home()` widget exposes the main app funtionality.
