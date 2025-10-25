# Create an App

## lib/

The `lib/` directory contains the dart source code.

### main.dart

The `main.dart` is the expected main entry point to the app. Its task
in our framework is to initialise the appliocation and then launch the
app itself.

### app.dart

The `App()` is typically where we instantiate a `SolidLogin()`, often
as the `child:` of a `SolidThemeApp()`.  The `SolidLogin()` provides
the login page for the app. After logging in the `AppScaffold()`, as
the `child:` of the `SolidLogin()`, is instantiated to contain the
main functionality of the app.

### app_scaffold.dart

The `AppScaffold()` builds a `SolidScaffold()` to set up the framework
for a typical Solid app. The child is the `Home()` widget.

### home.dart

The `Home()` widget implements the main app funtionality.
