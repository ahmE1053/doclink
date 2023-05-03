String formatDuration(Duration duration) {
  int days = duration.inDays;
  int hours = duration.inHours.remainder(24);
  int minutes = duration.inMinutes.remainder(60);
  String formattedTime = '';
  if (days > 0) {
    formattedTime = '$days ${days == 1 ? 'day' : 'days'} ';
    return formattedTime;
  }
  if (hours > 0) {
    formattedTime = '$hours ${hours == 1 ? 'hour' : 'hours'} ';
    return formattedTime;
  }
  if (minutes > 0) {
    formattedTime += '$minutes ${minutes == 1 ? 'minute' : 'minutes'} ';
    return formattedTime;
  }

  return 'Now';
}
