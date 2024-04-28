T enumFromString<T>(String key, List<T> values, T defualtValue){
  return values.firstWhere((value) => key.toLowerCase() == value.toString().split('.').last.toLowerCase()) ?? defualtValue;
}


