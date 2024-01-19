sealed class LocatorException {}

final class WebBrowserHasNoPermissionAPI implements LocatorException {}

final class DeniedUntilChangedOnAppSettings implements LocatorException {}

final class UserDoNotAllowService implements LocatorException {}

final class ServiceIsNotEnabled implements LocatorException {}
