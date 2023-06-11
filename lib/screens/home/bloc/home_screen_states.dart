class HomeScreenStates{
  const HomeScreenStates({this.index = 0, });
  final int index;
HomeScreenStates copyWith({int? index}){
  return HomeScreenStates(
    index: index??this.index
  );
}
}