abstract class OrderEvent {}

class CloseSideMenu extends OrderEvent {
  CloseSideMenu();
}

class OpenSideMenu extends OrderEvent {
  OpenSideMenu();
}
