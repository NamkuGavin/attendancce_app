/// Message
const serverFailureMessage = 'An error occurred, please try again';
const networkFailureMessage = 'Network error';
const connectionFailureMessage =
    'There is a connection problem, please try again';
const cacheFailureMessage = 'A local problem occurred, please try again';
const sessionExpiredFailureMessage =
    'Your session has ended. Please login again to use the application';
const permissionFailureMessage = 'Permission error';

/// Key
const cachedBearerToken = 'BEARER_TOKEN';
const cachedAbsentInformation = 'ABSENT_INFORMATION';
const cachedAbsentSchedule = 'ABSENT_SCHEDULE';
const cachedAbsentId = 'ABSENT_ID';

List<String> get cachedKeys => [
      cachedBearerToken,
      cachedAbsentInformation,
      cachedAbsentSchedule,
      cachedAbsentId,
    ];
