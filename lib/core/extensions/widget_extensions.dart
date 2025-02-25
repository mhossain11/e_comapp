import 'package:flutter/widgets.dart';

import '../../features/shared/widgets/dynamic_loader_widget.dart';

extension WidgetExt on Widget {
  DynamicLoaderWidget loading(bool isLoading) {
    return DynamicLoaderWidget(originalWidget: this, isLoading: isLoading);
  }
}
