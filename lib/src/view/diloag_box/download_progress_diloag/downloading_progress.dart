import 'package:flutter/material.dart';
import 'package:flutter_gallery/src/view/diloag_box/download_progress_diloag/option/cancle.dart';
import 'package:flutter_gallery/src/view/diloag_box/download_progress_diloag/option/complate.dart';
import 'package:flutter_gallery/src/view/diloag_box/download_progress_diloag/progress_dioloag.dart';
import 'package:flutter_gallery/src/widgets/fx_files/app_bar.dart';

class DownloadProgressDiloag extends StatelessWidget {
  const DownloadProgressDiloag({super.key});

  _normalProgress(context) async {
    /// Create progress dialog
    ProgressDialog pd = ProgressDialog(context: context);

    /// Set options
    /// Max and msg required
    pd.show(
      max: 100,
      msg: 'File Downloading...',
      progressBgColor: Colors.transparent,
      cancel: Cancel(
        cancelClicked: () {
          /// ex: cancel the download
        },
      ),
    );
    for (int i = 0; i <= 100; i++) {
      /// You don't need to update state, just pass the value.
      /// Only value required
      pd.update(value: i);
      i++;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  _valuableProgress(context) async {
    ProgressDialog pd = ProgressDialog(context: context);

    pd.show(
      max: 100,
      msg: 'File Downloading...',

      /// Assign the type of progress bar.
      progressType: ProgressType.valuable,
    );
    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);
      i++;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  _preparingProgress(context) async {
    ProgressDialog pd = ProgressDialog(context: context);

    /// show the state of preparation first.
    pd.show(
      max: 100,
      msg: 'Preparing Download...',
      progressType: ProgressType.valuable,
    );

    /// Added to test late loading starts
    await Future.delayed(const Duration(milliseconds: 3000));
    for (int i = 0; i <= 100; i++) {
      /// You can indicate here that the download has started.
      pd.update(value: i, msg: 'File Downloading...');
      i++;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  _customProgress(context) async {
    ProgressDialog pd = ProgressDialog(context: context);

    /// show the state of preparation first.
    pd.show(
        max: 100,
        msg: 'Preparing Download...',
        progressType: ProgressType.valuable,
        backgroundColor: const Color(0xff212121),
        progressValueColor: const Color(0xff3550B4),
        progressBgColor: Colors.white70,
        msgColor: Colors.white,
        valueColor: Colors.white);

    /// Added to test late loading starts
    await Future.delayed(const Duration(milliseconds: 3000));
    for (int i = 0; i <= 100; i++) {
      /// You can indicate here that the download has started.
      pd.update(value: i, msg: 'File Downloading...');
      i++;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  _completedProgress(context) async {
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      max: 100,
      msg: 'File Downloading...',
      completed: Completed(),
      // Completed values can be customized
      // Completed(completedMsg: "Downloading Done !", completedImage: AssetImage("images/completed.png"), completionDelay: 2500,),
      progressBgColor: Colors.transparent,
    );
    for (int i = 0; i <= 100; i++) {
      pd.update(value: i);
      i++;
      await Future.delayed(const Duration(milliseconds: 100));
    }
  }

  _onlyMessageProgress(context) async {
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: true,
      msg: "Please waiting...",
      hideValue: true,
    );

    /** You can update the message value after a certain action **/
    await Future.delayed(const Duration(milliseconds: 1000));
    pd.update(msg: "Almost done...");

    await Future.delayed(const Duration(milliseconds: 1000));
    pd.close();
  }

  _onlyMessageWithCompletionProgress(context) async {
    ProgressDialog pd = ProgressDialog(context: context);
    pd.show(
      barrierDismissible: true,
      msg: "Please waiting...",
      hideValue: true,
      completed: Completed(), // Set Completed
    );

    /** You can update the message value after a certain action **/
    await Future.delayed(const Duration(milliseconds: 1000));

    /**
     * if you can't assign value and want to use completed object. You should set the Value to 100.
     * The dialog will close automatically.
     * **/
    pd.update(msg: "Almost done...", value: 100);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(
        title: Text("Downloading Progress Bar"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                color: const Color(0xfff7f7f7),
                child: const Text('Normal Progress'),
                onPressed: () {
                  _normalProgress(context);
                }),
            MaterialButton(
                color: const Color(0xfff7f7f7),
                child: const Text('Valuable Progress'),
                onPressed: () {
                  _valuableProgress(context);
                }),
            MaterialButton(
                color: const Color(0xfff7f7f7),
                child: const Text('Preparing Progress'),
                onPressed: () {
                  _preparingProgress(context);
                }),
            MaterialButton(
                color: const Color(0xfff7f7f7),
                child: const Text('Custom Progress'),
                onPressed: () {
                  _customProgress(context);
                }),
            MaterialButton(
                color: const Color(0xfff7f7f7),
                child: const Text('Completed Progress'),
                onPressed: () {
                  _completedProgress(context);
                }),
            MaterialButton(
                color: const Color(0xfff7f7f7),
                child: const Text('Message Progress'),
                onPressed: () {
                  _onlyMessageProgress(context);
                }),
            MaterialButton(
                color: const Color(0xfff7f7f7),
                child: const Text('Message Progress With Completed'),
                onPressed: () {
                  _onlyMessageWithCompletionProgress(context);
                }),
          ],
        ),
      ),
    );
  }
}
