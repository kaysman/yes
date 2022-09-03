import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yes/presentation/shared/colors.dart';
import 'package:yes/presentation/shared/network-change-manager/network_change_handle_manager.dart';

class NoNetworkWidget extends StatefulWidget {
  NoNetworkWidget({Key? key}) : super(key: key);

  @override
  State<NoNetworkWidget> createState() => _NoNetworkWidgetState();
}

class _NoNetworkWidgetState extends State<NoNetworkWidget> {
  late final INetworkChangeManager _networkChange;
  NetworkResult? _networkResult;

  @override
  void initState() {
    _networkChange = NetworkChangeManager();
    fetchFirstResult();
    _networkChange.handleNetworkChange((result) {
      _updateView(result);
    });
    super.initState();
  }

  Future<void> fetchFirstResult() async {
    WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) async {
      final result = await _networkChange.checkNetworkFirstTime();
      _updateView(result);
    });
  }

  void _updateView(NetworkResult result) {
    setState(() {
      _networkResult = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      firstChild: Container(
        color: kBlack.withOpacity(.8),
        padding: const EdgeInsets.all(8),
        height: 40,
        child: Row(
          children: [
            Icon(
              CupertinoIcons.wifi_slash,
              color: kWhite,
            ),
            SizedBox(
              width: 8,
            ),
            Text(
              'You are offline! Please check your internet connection',
              style:
                  Theme.of(context).textTheme.caption?.copyWith(color: kWhite),
            ),
          ],
        ),
      ),
      secondChild: SizedBox(),
      crossFadeState: _networkResult == NetworkResult.off
          ? CrossFadeState.showFirst
          : CrossFadeState.showSecond,
      duration: Duration(
        milliseconds: 100,
      ),
    );
  }
}


// mixin 
