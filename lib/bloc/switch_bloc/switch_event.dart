import 'package:equatable/equatable.dart';

 abstract class SwitchEvent extends Equatable{

  const SwitchEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class SwitchEnableDisable extends SwitchEvent{
}

class SliderScroll extends SwitchEvent{
 final double sliderValue;
  const SliderScroll ({required this.sliderValue});
  @override
  List<Object?> get props => [sliderValue];
}