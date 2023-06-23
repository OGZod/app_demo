abstract class AppEvents{
  const AppEvents();
}
  class TriggerAppEvent extends AppEvents{
    final int index;
    const TriggerAppEvent(this.index):super();
  }
  class TriggerAppBarEvent extends AppEvents{
    final int appBarIndex;
    const TriggerAppBarEvent(this.appBarIndex):super();
  }

